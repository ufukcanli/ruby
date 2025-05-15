# Define a class named Sensor
class Sensor
  # Define a method to simulate temperature readings
  def temperature
    rand(100..200) # Generate a random number between 100 and 200
  end

  # Define a method to simulate water level readings
  def level
    rand(1..5) # Generate a random number between 1 and 5
  end
end

# Create a new instance of the Sensor class
sensor = Sensor.new

# Check the water temperature
puts "Checking water temperature..." # Print a message indicating the check
result = sensor.temperature < 150 # Check if the temperature is less than 150
if result
  puts "OK" # Print "OK" if the condition is true
else
  puts "FAILED!" # Print "FAILED!" if the condition is false
end

# Check the water level
puts "Checking water level..." # Print a message indicating the check
result = sensor.level > 3 # Check if the water level is greater than 3
if result
  puts "OK" # Print "OK" if the condition is true
else
  puts "FAILED!" # Print "FAILED!" if the condition is false
end

# Define a method to perform checks with a description and a block
def with_checking(description)
  puts "Checking #{description}..." # Print a message with the description
  result = yield # Execute the block and store the result
  if result
    puts "OK" # Print "OK" if the block's result is true
  else
    puts "FAILED!" # Print "FAILED!" if the block's result is false
  end
rescue Exception => e # Handle any exceptions raised during the block execution
  puts "ERROR!" # Print "ERROR!" if an exception occurs
  raise e # Re-raise the exception for further handling
end

# Use the with_checking method to check the temperature
with_checking("temperature") do
  sensor.temperature < 150 # Check if the temperature is less than 150
end

# Use the with_checking method to check the water level
with_checking("level") do
  sensor.level > 3 # Check if the water level is greater than 3
end
