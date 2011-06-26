require './lib/to_google_spreadsheet'

data = [
  {
    :name => "Niklas",
    :age => 23,
    :job => "Product designer"
  },
  {
    :name => "Simon",
    :age => 16,
    :job => "Developer"
  },
  {
    :name => "Peter",
    :age => 40,
    :job => "CEO"
  }
]

data.to_google_spreadsheet("Employees")
