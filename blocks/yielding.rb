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