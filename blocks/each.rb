# Methods like `each` invoke a block of code multiple times.
# These methods are often called iterators.
# Iterators are named this way because they iterate over objects in a collection.

# One cool feature of Ruby is its built-in support for `each` iterators.
# The `each` method is defined on collection classes like arrays and hashes.
# This makes it easy to loop through the elements in these collections.

# Similar to methods like `times` and `upto`,
# the `each` method executes an associated block.
# It runs the block once for every element in the collection.

# When iterating over an array using `each`:
# - The method passes each element of the array to the block in sequence.

# When iterating over a hash using `each`:
# - The method passes each key

# Define the Person class
# The `Person` class has attributes for `name`, `age`, and `email`
class Person
  # Use attr_reader to automatically create getter methods for name, age, and email
  attr_reader :name, :age, :email

  # Initialize method to create a new Person object with name, age, and email
  def initialize(name, age, email)
    @name = name    # Set the name attribute
    @age = age      # Set the age attribute
    @email = email  # Set the email attribute
  end

  # Define a method to convert the Person object to a string representation
  def to_s
    "#{name}, Age: #{age}, Email: #{email}" # Return a string with name, age, and email
  end
end

# Create an empty array to store Person objects
people = []

# Populate the people array with 5 Person objects, each with a unique name and age
1.upto(5) do |number|
  people << Person.new("Person #{number}", "2#{number}",  "person#{number}@example.com")
end

# Iterate through the `people` array and print each Person's name, age, and email
people.each { |person| puts "#{person.name} - #{person.age} - #{person.email}" }

puts "-" * 50 # Separator

# Create a variable `total` to store the sum of ages
total = 0

# Iterate through the `people` array to calculate the total age
people.each do |person|
  total += person.age.to_i
end

# Output the total sum of ages
puts "Total age: #{total}"

puts "-" * 50 # Separator

# Define a hash with city names as keys and random temperatures as values
cities = {
  "New York" => rand(60..100),
  "Los Angeles" => rand(60..100),
  "Chicago" => rand(60..100),
  "Houston" => rand(60..100),
  "Phoenix" => rand(60..100)
}

# Iterate through the `cities` hash to print each city and its corresponding temperature
cities.each do |city, temperature|
  puts "City: #{city}, Temperature: #{temperature}°F."
end

puts "-" * 50 # Separator

# Iterate through each person and each city to print travel info with the temperature
people.each do |person|
  cities.each do |city, temperature|
    puts "#{person.name} has traveled #{city} with a temperature of #{temperature}°F."
  end
end

puts "-" * 50 # Separator
 
# Define an array of card names
cards = [ "Jack", "Queen", "King", "Ace", "Joker" ]

# Shuffle the cards array, and iterate through each card to print the uppercase card name and its length
cards.shuffle.each { |card| puts "#{card.upcase} - #{card.length}" }

# Iterate through the cards in reverse order and print the uppercase card name and its length
cards.reverse_each { |card| puts "#{card.upcase} - #{card.length}" }

puts "-" * 50 # Separator

# Define an array of names
names = [ "Ava", "Liam", "Noah" ]

# Convert the array of names into a hash with random scores for each name
scores = names.to_h do |name|
  [name, rand(5..15)] # Assign a random score between 5 and 15 to each name
end

# Iterate through the `scores` hash and print each person's score
scores.each do |name, score|
  puts "#{name} scored a #{score}!" # Print the person's name and score
end
