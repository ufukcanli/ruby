# The `Enumerable` module adds a powerful collection of methods to Ruby classes.
# These methods help you work with collections like arrays and hashes in elegant ways.

# Most Enumerable methods are enhanced iterators that require a block.
# A block is a chunk of code you pass to a method to be executed.

# These methods are called "souped-up" because they do more than just loop.
# For example, they can filter, transform, or search through elements.

# Using Enumerable is a great way to practice writing and understanding blocks.
# It also helps you write more expressive and concise Ruby code.

# An array of scores representing some numerical data.
scores = [ 83, 71,  92, 64, 98, 87, 75, 69 ]

# Using the `select` method to filter scores greater than 80.
# The block `{ |score| score > 80 }` specifies the condition for selection.
high_scores = scores.select { |score| score > 80 }
# Output the filtered high scores to the console.
p high_scores

# Using the `reject` method to filter scores less than or equal to 80.
# The block `{ |score| score > 80 }` specifies the condition for rejection.
low_scores = scores.reject { |score| score > 80 }
# Output the filtered low scores to the console.
p low_scores

# Using the `any?` method to check if any score is less than 70.
# The block `{ |score| score < 70 }` specifies the condition to check.
puts scores.any? { |score| score < 70 }

# Using the `detect` method to find the first score less than 70.
# The block `{ |score| score < 70 }` specifies the condition to find.
puts scores.detect { |score| score < 70 }

# Using the `map` method to create a new array with each score doubled.
# The block `{ |score| score * 2 }` specifies the transformation to apply.
scores_doubled = scores.map { |score| score * 2 }
# Output the array of scores doubled to the console.
p scores_doubled

# Using the `reduce` method to calculate the total of all scores.
# The block `{ |sum, score| sum + score }` specifies how to accumulate the total.
total = scores.reduce(0) { |sum, score| sum + score }
# Output the total score to the console.
puts "Total score: #{total}"

# Using the `reduce` method with the `:+` symbol to calculate the total of all scores.
# This is a shorthand for summing up the elements.
total = scores.reduce(0, :+)
# Output the total score to the console using the shorthand `reduce` method.
puts "Total score: #{total}"

# Using the `partition` method to separate scores into even and odd numbers.
# The block `{ |score| score.even? }` specifies the condition for partitioning.
evens, odds = scores.partition { |score| score.even? }
# Output the even scores to the console.
puts "Evens:"
p evens
# Output the odd scores to the console.
puts "Odds:"
p odds