require 'to_google_spreadsheet'

# data = [
#   {
#     :name => "Niklas",
#     :age => 23,
#     :job => "Product designer"
#   },
#   {
#     :name => "Simon",
#     :age => 16,
#     :job => "Developer"
#   },
#   {
#     :name => "Peter",
#     :age => 40,
#     :job => "CEO"
#   }
# ]

GoogleSpreadsheet.config do |c|
  c.email               = "dummy"
  c.password            = "seekrit"
  c.default_spreadsheet = "0Agovhaw3pUnDdERZT3oyemlQY2JUaGJjQWNhb0Q3b2c"
end

p GoogleSpreadsheet::Config.email

[{:name => "Bob", :age => 26}, {:name => "John", :age => 28}].to_google_spreadsheet("Employees")

#data.to_google_spreadsheet("Employees")
