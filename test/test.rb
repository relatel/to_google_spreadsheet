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

# module ToGoogleSpreadsheet
#   CREDENTIALS = ["system-docs@firmafon.dk", "pinkpony42"]
#   DEFAULT_SPREADSHEET = "tA6lV1NLsBsDNuP_y8sISIw"
# end
# 
# GoogleSpreadsheet.config do

# end

GoogleSpreadsheet.config do |c|
  c.email               = "system-docs@firmafon.dk"
  c.password            = "pinkpony42"
  c.default_spreadsheet = "0Agovhaw3pUnDdERZT3oyemlQY2JUaGJjQWNhb0Q3b2c"
end

p GoogleSpreadsheet::Config.email

[{:name => "Bob", :age => 26}, {:name => "John", :age => 28}].to_google_spreadsheet("Employees")

#data.to_google_spreadsheet("Employees")
