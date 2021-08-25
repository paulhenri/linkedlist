# @author Paul-Henri BONNEMENT
class LinkedList
  attr_reader :list

  public
  # Constructor of the class
  # @param init_value [Integer] Value of the first node
  def initialize(init_value)
    @nb_nodes = 1
    @list = Node.new
    @list.value = init_value
    @current_node = @list
  end

  # Push a value at the end of the list
  # @param value [Integer] Value of the new node
  def append(value)
    @current_node = @list
    @current_node = @current_node.next until @current_node.next.nil?
    @current_node.next = Node.new
    @current_node = @current_node.next
    @current_node.value = value
  end

  # Place a value at the beginning of the list
  # @param value [Integer] value of the new node
  def prepend(value)
    new_node = Node.new
    new_node.value = value
    new_node.next = @list
    @list = new_node
  end

  # Return the size of the list
  # @return [Integer] Number of nodes
  def size
    calc_size
  end

  # Return first node
  # @return [Node] First node
  def head
    @list
  end

  # Return last node
  # @return [Node] Last node
  def tail
    current_node = @list
    current_node = current_node.next until current_node.next.nil?
    current_node
  end

  # Return node located at given index
  # @param index [Integer] location
  # @return [Node, nil] Node if found, nil if not located (Index out of bound)
  def at(index)
    if index <= 0 || index > size
      nil
    else
      current_node = @list
      nb = 1
      while nb != index
        current_node = current_node.next
        nb += 1
      end
      current_node
    end
  end

  # Pop the last node (removes it)
  def pop
    size = self.size
    at(self.size - 1).next = nil if size > 1
  end

  # Check if given element is contained in the list
  # @return [true, false]
  def contains?(value)
    current = @list
    until current.nil?
      return true if current.value == value

      current = current.next
    end
    false
  end

  # Return first node with corresponding value
  # @param value [Integer] value to be searched for
  # @return [Node, nil]
  def find(value)
    current = @list
    until current.nil?
      return true if current.value == value

      current = current.next
    end
    false
  end

  # To String modification
  # @return [String] String representation of the list (x) -> (y) -> [..] -> nil
  def to_s
    to_s_string = ""
    current = @list
    until current.nil?
      to_s_string << "(#{current.value}) -> "
      current = current.next
    end
    to_s_string << 'nil'
    return to_s_string
  end

  # Insert a new node at given location
  # @param index [Integer] location of new node
  # @param value [Integer] Value for the new node
  # @return [true, false] Result of the insertion
  def insert_at(index, value)
    return false if index.negative? || index > size

    if index > 1 && index <= size
      replaced_node = at(index)
      new_node = Node.new
      new_node.value = value
      new_node.next = replaced_node
      at(index - 1).next = new_node
    else
      prepend(value)
    end
    true
  end

  # Removes node at given location
  # @param index [Integer] Index of the node to be removed
  # @return [true, false] Issue of the command
  def remove_at(index)
    return false if index.negative? || index > size

    if index > 1
      new_next_node = at(index + 1)
      at(index - 1).next = new_next_node
    else
      @list = @list.next
    end
    true
  end

  private
  #  Calculate the number of node by travesing the list
  #  @return [Integer] Number of nodes
  def calc_size
    nb = 0
    current_node = @list
    until current_node.nil?
      nb += 1
      current_node = current_node.next
    end
    nb
  end


end

# Represent a Node, used in LinkedList class
class Node
  attr_accessor :value, :next

  # Constructor
  def initialize
    @value = nil
    @next = @nil
  end
end
