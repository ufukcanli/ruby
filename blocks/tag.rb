# Define a method to print an <h1> HTML tag with content from a block
def h1
  print "<h1>"         # Print the opening <h1> tag
  print yield          # Print the result of the block
  print "</h1>"        # Print the closing </h1> tag
  print "\n"           # Print a newline
end

# Define a method to print an <h2> HTML tag with content from a block
def h2
  print "<h2>"         # Print the opening <h2> tag
  print yield          # Print the result of the block
  print "</h2>"        # Print the closing </h2> tag
  print "\n"           # Print a newline
end

# Call h1 with a block that returns a string
h1 { "Breaking News!" }                # Prints <h1>Breaking News!</h1>

# Call h2 with a block that returns a string
h2 { "Massive Ruby Discovered" }       # Prints <h2>Massive Ruby Discovered</h2>

# Define a generic tag method that prints any HTML tag with content from a block
def tag(name)
  print "<#{name}>"    # Print the opening tag using the given name
  print yield          # Print the result of the block
  print "</#{name}>"   # Print the closing tag using the given name
  print "\n"           # Print a newline
end

# Call tag with :h1 and a block
tag(:h1) { "Breaking News!" }          # Prints <h1>Breaking News!</h1>

# Call tag with :h2 and a block
tag(:h2) { "Massive Ruby Discovered" } # Prints <h2>Massive Ruby Discovered</h2>

# Call tag with :ul and a block that contains nested tag calls
tag(:ul) do                            # Prints <ul>...</ul>
  tag(:li) { "It sparkles!" }          #   Prints <li>It sparkles!</li>
  tag(:li) { "It shines!" }            #   Prints <li>It shines!</li>
  tag(:li) { "It mesmerizes!" }        #   Prints <li>It mesmerizes!</li>
end