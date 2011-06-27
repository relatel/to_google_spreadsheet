# to_google_spreadsheet

to_google_spreadsheet makes it trivial to populate a Google spreadsheet with an Array of Ruby objects.

    # Adds the users Bob and John to the default spreadsheet in the worksheet Employees
    [{:name => "Bob", :age => 26}, {:name => "John", :age => 28}].to_google_spreadsheet("Employees")

Results in:

![Image of Google spreadsheets result once running above command](http://f.cl.ly/items/2O3w2k0Y410R3c3r3T1K/Screen%20shot%202011-06-27%20at%209.16.11%20.png)

## Setup

You must provide your Google Docs credentials, optionally you can supply a default spreadsheet to use:
    
```ruby
module ToGoogleSpreadsheet
  CREDENTIALS = ["account@company.com", "seekrit"]
  DEFAULT_SPREADSHEET = "spreadsheet_key" # see note below
end
```

The spreadsheet key is found in the URL when visiting the spreadsheet:

![Image showing how the key is found in the URL in Google Docs](http://f.cl.ly/items/3j2q0S063j3v1I1P3x1p/Screen%20shot%202011-06-27%20at%209.24.56%20.png)

## Supported objects

```ruby
assert array.all? {|e| [OpenStruct,Hash,ActiveRecord::Base].any? { |type| e.kind_of?(type) }}  to a Google spreadsheet
```

I.e. anything that is `#kind_of? Hash`, an `OpenStruct` or an ActiveRecord model. It is [easy to add support for additional types][at].

[at]: https://github.com/firmafon/to_google_spreadsheet/blob/master/lib/to_google_spreadsheet.rb#L46-50

