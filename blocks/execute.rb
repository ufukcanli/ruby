# Define a method `time_it` that takes a label as an argument
def time_it(label)
  # Record the current time as the start time
  start_time = Time.now
  # Execute the block of code passed to the method
  yield
  # Calculate the elapsed time by subtracting the start time from the current time
  elapsed_time = Time.now - start_time
  # Print the label and the elapsed time
  puts "#{label} took #{elapsed_time}"
end

# Call the `time_it` method with the label "Sleepy code"
time_it("Sleepy code") do
  # Pause execution for 0.5 seconds
  sleep(0.5)
end

# Call the `time_it` method with the label "Sleepier code"
time_it("Sleepier code") do
  # Pause execution for 1.0 seconds
  sleep(1.0)
end