# Define a method `three_times` that yields to a block three times.
def three_times
  yield
  yield
  yield
end

# Call `three_times` with a block that prints "Hello, World!".
three_times { puts "Hello, World!" }

puts "-" * 50 # Separator

# Redefine the `three_times` method to yield numbers (1, 2, 3) to the block.
def three_times
  yield(1)
  yield(2)
  yield(3)
end

# Call `three_times` with a block that prints exercises for each number.
three_times do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end

puts "-" * 50 # Separator

# Redefine the `three_times` method to use `upto` for yielding numbers.
def three_times
  1.upto(3) do |count|
    yield(count)
  end
end

# Call `three_times` with a block that prints exercises for each number.
three_times do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end

puts "-" * 50 # Separator

# Define a method `deal` that yields a random card face and suit to a block.
def deal
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  random_face = faces.sample
  random_suite = suits.sample
  yield random_face, random_suite
end

# Call `deal` with a block that prints the dealt card.
deal { |face, suit| puts "Dealt a #{face} of #{suit}" }

puts "-" * 50 # Separator

# Redefine the `deal` method to calculate a score based on the card dealt.
def deal
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  random_face = faces.sample
  random_suite = suits.sample
  score = yield random_face, random_suite
  puts "You scored a #{score}!"
end

# Call `deal` with a block that calculates and prints the score.
deal do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end

puts "-" * 50 # Separator

# Redefine the `deal` method to check if a block is given before yielding.
def deal
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]

  if block_given?
    random_face = faces.sample
    random_suit = suits.sample
    score = yield random_face, random_suit
    puts "You scored a #{score}!"
  else
    puts "No deal!"
  end
end

# Call `deal` without a block to demonstrate the `block_given?` check.
deal

puts "-" * 50 # Separator

# Define a method `temperature` that yields the day and temperature in Fahrenheit to a block.
def temperature
  puts "Taking temperature:" # Inform the user that the temperature is being processed.
  result = yield("Thursday", 32) # Yield the day and temperature to the block and store the result.
  puts "The temperature in Celsius is #{result}" # Output the converted temperature in Celsius.
end

# Call `temperature` with a block that converts Fahrenheit to Celsius.
temperature do |day, temp|
  puts "The day is #{day} and the temperature is #{temp}." # Output the day and temperature in Fahrenheit.
  (temp - 32) * 5 / 9 # Convert the temperature to Celsius.
end

puts "-" * 50 # Separator

# Define a method `n_times` that yields to a block a specified number of times.
# The block receives the current iteration count as an argument.
def n_times(number)
  1.upto(number) do |count| # Iterate from 1 to the given number.
    yield(count) # Yield the current count to the block.
  end
end

# Call `n_times` with a block that prints exercises for each iteration.
n_times(5) do |n|
  puts "#{n} situps" # Print the number of situps.
  puts "#{n} pushups" # Print the number of pushups.
  puts "#{n} chinups" # Print the number of chinups.
end

puts "-" * 50 # Separator

# Redefine the `deal` method to deal a specified number of cards.
# The method yields each card's face and suit to the block.
def deal(number_of_cards)
  faces = ["Jack", "Queen", "King", "Ace"] # Array of card faces.
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"] # Array of card suits.

  if block_given? # Check if a block is provided.
    number_of_cards.times do # Repeat for the specified number of cards.
      random_face = faces.sample # Select a random face.
      random_suit = suits.sample # Select a random suit.
      score = yield random_face, random_suit # Yield the face and suit to the block and store the score.
      puts "You scored a #{score}!" # Output the score.
    end
  else
    puts "No deal!" # Output a message if no block is provided.
  end
end

# Call `deal` with a block that calculates and prints the score for each card.
deal(10) do |face, suit|
  puts "Dealt a #{face} of #{suit}" # Print the dealt card.
  face.length + suit.length # Calculate the score based on the lengths of the face and suit.
end

puts "-" * 50 # Separator

# Define a method `progress` that yields numbers from 0 to 100 in steps of 10 to a block.
def progress
  0.step(by: 10, to: 100) do |number| # Iterate from 0 to 100 in increments of 10.
    yield number # Yield the current number to the block.
  end
end

# Call `progress` with a block that prints the progress percentage.
progress { |percent| puts percent } # Print each percentage value.
