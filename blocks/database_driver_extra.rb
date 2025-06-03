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
    puts "Connected to #{@database} as #{@user}."   # Print connection message
  end

  def disconnect                                   # Simulate disconnecting from a database
    # disconnects from database
    puts "Disconnected."                           # Print disconnection message
  end

  def begin_transaction                            # Simulate beginning a transaction
    puts "Beginning transaction..."                # Print transaction begin message
  end

  def commit_transaction                           # Simulate committing a transaction
    puts "Committed transaction."                  # Print transaction commit message
  end

  def rollback_transaction                         # Simulate rolling back a transaction
    puts "Rolled back transaction!"                # Print transaction rollback message
  end

  def execute(sql)                                 # Simulate executing an SQL statement
    raise "Not connected!" unless @connected       # Raise error if not connected
    puts "Executing #{sql}..."                     # Print SQL execution message
  end

  def transactionally                              # Run a block within a transaction
    begin_transaction                             # Begin transaction
    yield                                         # Yield to the block
    commit_transaction                            # Commit transaction if block succeeds
  rescue                                          # If an error occurs in the block
    rollback_transaction                          # Rollback transaction
  end
end

# Use DatabaseDriver with a block and run some statements in a transaction
DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.transactionally do                           # Start a transaction
    driver.execute("UPDATE ORDERS SET status='completed'") # Execute SQL update
    driver.execute("DELETE * FROM SHIPPING_QUEUE")         # Execute SQL delete
  end

  # not run in a transaction
  driver.execute("SELECT * FROM ORDERS")                  # Execute SQL select
  driver.execute("SELECT * FROM USERS")                   # Execute another SQL select
end

# Use DatabaseDriver with a block, run a transaction, and raise an error to test rollback
DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.transactionally do                               # Start a transaction
    driver.execute("UPDATE ORDERS SET status='completed'")# Execute SQL update
    raise "Boom!"                                         # Raise an error to simulate a problem
    driver.execute("DELETE * FROM SHIPPING_QUEUE")         # This line is not executed due to the error above
  end
end
