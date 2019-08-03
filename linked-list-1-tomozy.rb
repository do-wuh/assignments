class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil # Set empty variable = to nil
  end

  def push(value)
    @data = LinkedListNode.new(value, @data) # Create a new Stack and set it = to the current Node 
  end

  def pop
    return "nil" if @data.nil? # Check if the Stack is empty and if empty return nil
    value = @data.value # Get the value of the current Node and set it = to the variable value
    @data = @data.next_node # Set the next Node = to the current Node
    return value
  end
end

def reverse_list(list)
  stack = Stack.new # Create a new Stack with the list value = to stack

  while list
      stack.push(list.value) # Add the current Stack value to the stack list value
      list = list.next_node # Set the current Stack value = to the next stack list value
  end
  
  return stack.data # Return the stack list when the while loop ends
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)
print_values(revlist)

puts "-------"

stack = Stack.new
stack.push(1)
stack.push(2)
puts stack.pop
puts stack.pop
puts stack.pop
