def with_expectation(expected_value) # Define a method that takes an expected value as argument
  puts "Running tests..."            # Print a message indicating the test is running
  result = yield                     # Execute the block passed to the method and store its result
  if result == expected_value        # Compare the result with the expected value
    puts "Passed."                   # If they match, print "Passed."
  else
    puts "Failed."                   # If they don't match, print "Failed."
    puts "Expected #{expected_value}, but got #{result}." # Show what was expected and what was received
  end
end

with_expectation(4) { 2 + 2 }        # Call the method, expecting 4 as the result of 2 + 2
 
with_expectation(5) { 2 + 2 }        # Call the method, expecting 5 as the result of 2 + 2 (will fail)
