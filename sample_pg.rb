# Use pg library
require 'pg'

# Connect to goyaDB from ruby by PG :: connect (dbname: "goya")
# Store connection information in a variable named connection
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  # Manipulate PostgreSQL using the connection variable
  # "select date, weight, give_for from crops;"
  # Directly execute SQL statement and store the result in result variable
  result = connection.exec("select date, weight, give_for from crops;")

  # Process each line taken out
  result.each do |record|
      # Take each line and put it on the terminal
      puts "Size of bitter gourd: #{record ["weight"]} Sold to: #{record ["give_for"]}"
  end
ensure
  # If you encounter some errors,
  # Stop the connection to the database with .finish
  connection.finish
end