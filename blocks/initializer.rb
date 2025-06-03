module Jem                           # Define a module named Jem
  class Specification                # Define a class Specification inside Jem
    attr_accessor :name, :version, :summary # Create getter/setter methods for name, version, summary

    def initialize                   # Define the initialize method (constructor)
      @version = "1.0.0"             # Set default version to "1.0.0"
      yield self if block_given?     # If a block is given, yield self to the block for further setup
    end
  end
end

spec = Jem::Specification.new do |s| # Create a new Specification, passing a block with parameter s
  s.name = "my-gem"                  # Set the name attribute to "my-gem"
  s.version = "2.0.0"                # Override the default version with "2.0.0"
  s.summary = "This is a cool gem!"  # Set the summary attribute
end

p spec                               # Print the spec object (shows its attributes)

puts "-" * 50                        # Print a separator line

class Canvas                         # Define a Canvas class
  attr_accessor :width, :height, :color # Create getter/setter methods for width, height, color

  def initialize                     # Define the initialize method (constructor)
    @width = 100                     # Set default width to 100
    @height = 100                    # Set default height to 100
    @color = :black                  # Set default color to :black
  
    yield self if block_given?       # If a block is given, yield self for further setup
  end

  def drawRect(x, y, width, height)  # Define a method to draw a rectangle (stub)
    # draws rectangle                # (No implementation, just a placeholder comment)
  end

  def to_s                           # Define a method to convert Canvas to string
    "#{@width}x#{@height} #{@color} canvas" # Return a string describing the canvas
  end
end

canvas = Canvas.new                  # Create a new Canvas object with default values
puts canvas                          # Print the canvas (calls to_s)

canvas = Canvas.new                  # Create another Canvas object with default values
canvas.width = 250                   # Set width to 250
canvas.height = 500                  # Set height to 500
canvas.color = :blue                 # Set color to :blue
p canvas                             # Print the canvas object (shows its attributes)

canvas2 = Canvas.new do |c|          # Create a new Canvas, passing a block with parameter c
  c.width = 800                      # Set width to 800 inside the block
  c.height = 600                     # Set height to 600 inside the block
  c.color = :green                   # Set color to :green inside the block
end

puts canvas2                         # Print canvas2 (calls to_s)
p canvas2                            # Print the canvas2 object (shows its attributes)