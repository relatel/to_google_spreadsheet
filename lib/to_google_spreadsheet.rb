require 'rubygems'
require 'google_spreadsheet'
require "to_google_spreadsheet/version"

# get the openstruct attribute hash
class OpenStruct
  def _hash
    @table
  end
end

module GoogleSpreadsheet
  def self.config
    yield GoogleSpreadsheet::Config
  end

  module Config
    extend self

    attr_accessor :email, :password, :default_spreadsheet
  end

  class Spreadsheet
    def find_or_create_worksheet_by_name(name)
      ws = worksheets.find {|ws| ws.title == name}
      ws ||= add_worksheet(name) # create it if it doesn't exists
      ws
    end
  end

  class Worksheet
    def set_header_columns(row)
      # #sort_by to sort by symbols
      get_hash_from_row(row).keys.sort_by { |k,v| k.to_s }.each_with_index do |key, col_nr|
        self[1, col_nr + 1] = humanize(key)
      end
    end

    def populate(rows)
      # TODO: Stop looping, put directly into the Google Spreadsheet hash
      # provided by the Gem
      # https://github.com/gimite/google-spreadsheet-ruby/blob/master/lib/google_spreadsheet.rb#L693-700
      rows.each_with_index do |row, row_nr|
        get_hash_from_row(row).sort_by { |k,v| k.to_s }.each_with_index do |val, col_nr|
          self[row_nr + 2, col_nr + 1] = val.last
        end
      end
    end

    private
    def get_hash_from_row(row)
      return row.attributes if row.respond_to?(:attributes) # ar
      return row._hash if row.respond_to?(:_hash) # ostruct
      row # fallback to handle hashes
    end

    def humanize(text)
      text.to_s.gsub(/_/, " ").capitalize
    end
  end
end

module Enumerable
  def to_google_spreadsheet(worksheet, spreadsheet = nil)
    # We do this explicityly instead of using the default_spreadsheet as default
    # in the parameters since we want to let people pass nil to indicate they
    # want to use the default spreadsheet.
    spreadsheet = GoogleSpreadsheet::Config.default_spreadsheet unless spreadsheet

    session = GoogleSpreadsheet.login(GoogleSpreadsheet::Config.email, 
                                      GoogleSpreadsheet::Config.password)
    spreadsheet = session.spreadsheet_by_key(spreadsheet)
    ws = spreadsheet.find_or_create_worksheet_by_name(worksheet)
    ws.set_header_columns(self.first)
    ws.populate(self)
    ws.save
  end
end
