# Blocks come in especially handy when dealing with expensive and/or limited resources such as files, network connections, and so on.
# Rather than putting the burden of managing those resources on the programmer,
# you can design these resources to manage their own life cycle.

class PaymentGateway
  def initialize(user, password)         # Constructor takes user and password
    @user = user                         # Store user in instance variable
    @password = password                 # Store password in instance variable
  end

  def connect                            # Simulate connecting to a remote service
    # connects to remote service
    puts "Connected as #{@user}!"        # Print connection message
  end

  def disconnect                         # Simulate disconnecting from a remote service
    # disconnects from remote service
    puts "Disconnected #{@user}!"        # Print disconnection message
  end

  def submit(type, amount)               # Simulate submitting a payment or refund
    # submits request to remote server
    puts "Submitted #{type} for #{amount}" # Print submission message
  end

  def self.open(user, password)          # Class method to open a connection and manage resource
    gateway = self.new(user, password)   # Create a new PaymentGateway instance
    gateway.connect                      # Connect to the remote service

    return gateway unless block_given?   # If no block is given, return the gateway for manual management

    begin
      yield(gateway)                     # Yield the gateway to the block for usage
    rescue Exception => e                # Rescue any exceptions raised in the block
      puts e.message                     # Print the exception message
    ensure
      gateway.disconnect                 # Always disconnect after block execution (even if error)
    end
  end
end

# Use PaymentGateway with a block, so connection/disconnection is managed automatically
PaymentGateway.open("ufuk", "secret") do |gateway|
  gateway.submit(:sale, 12.00)           # Submit a sale for 12.00
  gateway.submit(:sale, 10.00)           # Submit another sale for 10.00
end                                      # After block, disconnect is called

# Use PaymentGateway with a block, but raise an exception to test error handling
PaymentGateway.open("ufuk", "secret") do |gateway|
  gateway.submit(:refund, 5.00)          # Submit a refund for 5.00
  raise "Problem!"                       # Raise an error to simulate a problem
  gateway.submit(:refund, 20.00)         # This line is not executed due to the error above
end                                      # Exception is handled, disconnect is still called

puts "-" * 50                            # Print a separator line

f = File.open("letter.txt", "w")         # Open "letter.txt" for writing (creates the file if it doesn't exist)
f.puts "Hello!"                          # Write "Hello!" to the file
f.puts "Goodbye."                        # Write "Goodbye." to the file
f.close                                  # Close the file to release the resource

f = File.open("letter.txt", "r")         # Open "letter.txt" for reading
puts f.gets                              # Read and print the first line from the file
puts f.gets                              # Read and print the second line from the file
f.close                                  # Close the file to release the resource

class File
  def self.my_open(filename, mode)       # Define a class method my_open for File
    file = self.new(filename, mode)      # Open the file with the given mode and create a File object

    return file unless block_given?      # If no block is given, return the file for manual management

    begin
      yield(file)                        # Yield the file object to the block for usage
    ensure
      file.close                         # Always close the file after block execution (even if error)
    end
  end
end

File.my_open("letter.txt", "w") do |f|   # Open "letter.txt" for writing using my_open
  f.puts "Hello, again!"                 # Write "Hello, again!" to the file
  f.puts "Goodbye, again."               # Write "Goodbye, again." to the file
end                                     # File is automatically closed after the block

File.my_open("letter.txt", "r") do |f|   # Open "letter.txt" for reading using my_open
  puts f.gets                            # Read and print the first line from the file
  puts f.gets                            # Read and print the second line from the file
end                                     # File is automatically closed after the block

puts "-" * 50                            # Print a separator line

require "timeout"                        # Require the timeout library

Timeout.timeout(2.0) do                  # Run the block with a 2 second timeout
  sleep 1.0                              # Sleep for 1 second
  puts "That was refreshing..."          # Print message after sleep
end

begin
  Timeout.timeout(2.0) do                # Run the block with a 2 second timeout
    sleep 3.0                            # Sleep for 3 seconds (will exceed timeout)
    puts "That was refreshing..."        # This line will not be reached
  end
rescue Timeout::Error                    # Rescue timeout error
  puts "That took too long!"             # Print timeout message
end

def try_with_timeout(duration)           # Define a helper method to run a block with timeout
  begin
    Timeout.timeout(duration) do         # Run the block with the given timeout
      yield                             # Yield to the block
    end
  rescue Timeout::Error                  # Rescue timeout error
    puts "Took too long!"                # Print timeout message
  end
end

try_with_timeout(2.0) do                 # Call helper with 2 second timeout
  sleep 1.0                              # Sleep for 1 second
  puts "That was refreshing..."          # Print message after sleep
end

try_with_timeout(2.0) do                 # Call helper with 2 second timeout
  sleep 3.0                              # Sleep for 3 seconds (will exceed timeout)
  puts "That was refreshing..."          # This line will not be reached
end

puts "-" * 50                            # Print a separator line

require "open-uri"                       # Require the open-uri library

web_page = try_with_timeout(1.0) do      # Try to open a web page with a 1 second timeout
  URI.open("https://github.com/ufukcanli") # Open the given URL
end

puts web_page.read if web_page           # Print the web page content if it was fetched
