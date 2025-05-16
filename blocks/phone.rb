# Define a Phone class to simulate texting and airplane mode behavior
class Phone
  # Create a getter and setter for the airplane_mode attribute
  attr_accessor :airplane_mode

  # Initialize a new Phone object with airplane_mode set to false
  def initialize
    @airplane_mode = false
  end

  # Define a method to send or save a text message depending on airplane mode
  def text(message)
    if @airplane_mode
      puts "Saved text: #{message}" # If in airplane mode, save the text
    else
      puts "Sent text: #{message}"  # Otherwise, send the text
    end
  end

  # Define a method to temporarily enable airplane mode while executing a block
  def in_airplane_mode
    @airplane_mode = true           # Enable airplane mode
    yield                           # Execute the block of code passed to the method
  rescue Exception => e             # Handle any exceptions raised in the block
    puts e.message                  # Print the exception message
  ensure
    @airplane_mode = false          # Always disable airplane mode after the block
    puts "Reset mode to #{@airplane_mode}" # Print the current airplane mode status
  end
end

# Create a new Phone object
phone = Phone.new

# phone.airplane_mode = true
# phone.text("Just took off!")
# phone.text("At 30,000 ft!")
# phone.airplane_mode = false

# Example usage of in_airplane_mode:
# The block will run with airplane mode enabled, so texts are saved, not sent.
# If an exception is raised, it will be caught and printed.
# After the block, airplane mode is reset to false.
phone.in_airplane_mode do
  phone.text("Just took off!")      # Saved text: Just took off!
  phone.text("At 30,000 ft!")       # Saved text: At 30,000 ft!
  raise "Whoops!"                   # Simulate an error
end

# After airplane mode is reset, texts are sent normally.
phone.text("Just landed!")          # Sent text: Just landed!