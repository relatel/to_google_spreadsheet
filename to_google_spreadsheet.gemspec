# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "to_google_spreadsheet/version"

Gem::Specification.new do |s|
  s.name        = "to_google_spreadsheet"
  s.version     = ToGoogleSpreadsheet::VERSION
  s.authors     = ["Simon H. Eskildsen"]
  s.email       = ["sirup@sirupsen.com"]
  s.homepage    = ""
  s.summary     = %q{Convert an Array where Array.all? {|e| [OpenStruct,Hash,ActiveRecord::Base].any? { |type| e.kind_of?(type) }} to a Google spreadsheet}
  s.description = %q{Convert an Array where Array.all? {|e| [OpenStruct,Hash,ActiveRecord::Base].any? { |type| e.kind_of?(type) }} to a Google spreadsheet}

  s.rubyforge_project = "to_google_spreadsheet"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  s.add_dependency "google-spreadsheet-ruby"
  s.add_development_dependency "rspec"
end
