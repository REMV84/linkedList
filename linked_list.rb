class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
    attr_reader :data

    def initialize
        @data = nil
    end

    # Push a value onto the stack
    def push(value)
       @data = LinkedListNode.new(value,@data)
    end

    # Pop an item off the stack.
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
       value = nil;
       if @data
         value = @data.value
         @data = @data.next_node
       end
       return value
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

def reverse_list(list)
   stack = Stack.new
    while list
        stack.push(list.value)
        list = list.next_node
    end
    
    top = stack.pop
    head = LinkedListNode.new(top)
    current_head = head
    
    while top
      top = stack.pop
      if top
        node = LinkedListNode.new(top)
        current_head.next_node = node;
        current_head = node
      end
    end

    return head    
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)