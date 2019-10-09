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

def reverse_list(list, previous=nil)
  while list
    previous = LinkedListNode.new(list.value,previous)
    list = list.next_node
  end
  return previous
end

def is_list_infinite(list)
  list1 = list;
  list2 = list;

  while true
    
    if list1 == nil
      return false
    end
    
    list1 = list1.next_node

    if list1 == nil
      return false
    end

    list1 = list1.next_node
    list2 = list2.next_node

    if list1 == list2
      return true
    end
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)

puts  "Is list infinite \"#{is_list_infinite(node3)}\""

node1.next_node = node3

puts  "Is list infinite \"#{is_list_infinite(node3)}\""