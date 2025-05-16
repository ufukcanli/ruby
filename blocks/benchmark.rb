require "benchmark" # Import the Benchmark module for measuring code execution time

elapsed_time = Benchmark.realtime do # Start measuring the time taken to execute the block
  # run some code
  sleep(1) # Pause execution for 1 second to simulate work
end

puts "It took #{elapsed_time}" # Output the elapsed time to the console