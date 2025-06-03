class DatabaseDriver
  def initialize(database, user, password)         # Constructor takes database, user, and password
    @database = database                           # Store database name in instance variable
    @user = user                                   # Store user in instance variable
    @password = password                           # Store password in instance variable
    @connected = false                             # Track connection state
  end

  def self.open(database, user, password)          # Class method to open a connection and manage resource
    driver = self.new(database, user, password)    # Create a new DatabaseDriver instance
    driver.connect                                 # Connect to the database

    return driver unless block_given?              # If no block is given, return the driver for manual management

    begin
      yield(driver)                                # Yield the driver to the block for usage
    ensure
      driver.disconnect                            # Always disconnect after block execution (even if error)
    end
  end

  def connect                                      # Simulate connecting to a database
    # connects to database
    @connected = true                              # Set connection state to true
    puts "Connected to #{@database} as #{@user}"    # Print connection message
  end

  def disconnect                                   # Simulate disconnecting from a database
    # disconnects from database
    puts "Disconnected."                           # Print disconnection message
  end

  def execute(sql)                                 # Simulate executing an SQL statement
    raise "Not connected!" unless @connected       # Raise error if not connected
    puts "Executing #{sql}..."                     # Print SQL execution message
  end
end

db = DatabaseDriver.new("my_database", "admin", "secret") # Create a new DatabaseDriver instance
db.connect                                                # Connect to the database
db.execute("SELECT * FROM ORDERS")                        # Execute SQL query
db.execute("SELECT * FROM USERS")                         # Execute another SQL query
db.disconnect                                             # Disconnect from the database

DatabaseDriver.open("my_database", "admin", "secret") do |db| # Use DatabaseDriver with a block
  db.execute("SELECT * FROM ORDERS")                           # Execute SQL query
  db.execute("SELECT * FROM USERS")                            # Execute another SQL query
end                                                           # Disconnect is called after block

driver = DatabaseDriver.open("my_database", "admin", "secret") # Open connection without block
driver.execute("SELECT * FROM ORDERS")                         # Execute SQL query
driver.execute("SELECT * FROM USERS")                          # Execute another SQL query
driver.disconnect                                              # Disconnect manually

begin
  DatabaseDriver.open("my_database", "admin", "secret") do |driver| # Use DatabaseDriver with a block and raise error
    driver.execute("DELETE * FROM ORDERS")                          # Execute SQL query
    raise "Boom!"                                                   # Raise an error to simulate a problem
    driver.execute("DELETE * FROM USERS")                           # This line is not executed due to the error above
  end                                                              # Disconnect is still called after error
rescue Exception => e
  puts e.message                                                   # Print the exception message
end
