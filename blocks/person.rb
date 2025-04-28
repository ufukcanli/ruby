# Define the Person class
class Person
  # Use attr_reader to automatically create getter methods for name and age
  attr_reader :name, :age

  # Initialize a new Person object with a name and age
  def initialize(name, age)
    @name = name # Set the name attribute
    @age = age   # Set the age attribute
  end

  # Define a method to convert the Person object to a string representation
  def to_s
    "#{name}, Age: #{age}" # Return a string with the person's name and age
  end
end

# Create an empty array to store Person objects
people = []

# Populate the array with 5 Person objects
1.upto(5) do |number|
  people << Person.new("Person#{number}", number + 20) # Create a person with name and age
end

# Output the string representation of each Person object
puts people

puts "-" * 50 # Separator

# Create some Person objects
default_person = Person.new("Original", 30)
temp_person = Person.new("Temporary", 25)

# Iterate 3 times using block-local variables
3.times do |number; temp_person|
  temp_person = Person.new("BlockPerson#{number}", 20 + number)
  puts "#{number}: Hello, #{temp_person}!"
end

puts "-" * 50 # Separator

# Print original variables
puts "Default person: #{default_person}" # => Default person: Original, Age: 30
puts "Temp person: #{temp_person}"       # => Temp person: Temporary, Age: 25
