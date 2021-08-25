class LinkedList

  attr_reader :list

  public
  def initialize(init_value)
    @nb_nodes = 1
    @list = Node.new
    @list.value = init_value
    @current_node = @list
  end 

  public 
  def append(value)
    @nb_nodes += 1
    @current_node = @list
    while @current_node.next != nil 
      @current_node = @current_node.next
    end 
    @current_node.next = Node.new
    @current_node = @current_node.next
    @current_node.value = value
  end 

  public
  def prepend(value)
    @nb_nodes += 1
    new_node = Node.new 
    new_node.value = value 
    new_node.next = @list 
    @list = new_node
  end 

  public
  def size
    return @nb_nodes
  end 

  public
  def calc_size
    nb = 0
    @current_node = @list
    while @current_node != nil 
      nb += 1
      @current_node = @current_node.next
    end
    return nb
  end 

  public
  def head 
    return @list
  end 

  public
  def tail 
   current_node = @list
    while current_node.next != nil 
      current_node = current_node.next
    end 
   return current_node
  end 
  
  public
  def at(index)
    if index <= 0 || index > self.size 
      return nil
    else 
      current_node = @list
      nb=1
      while nb != index 
        current_node = current_node.next
        nb+=1
      end 
      return current_node
    end 
  end 

  public
  def pop 
    size = self.size 
    if size > 1 
      self.at(self.size - 1).next = nil
    end 
  end 

  def contains?(value)
    current = @list 
    while current != nil 
      return true if current.value == value
      current = current.next
    end 
    return false
  end 

  def find(value) 
    current = @list 
    while current != nil 
      return true if current.value == value
      current = current.next
    end 
    return false
  end 

  def to_s
    to_s_string = ""
    current = @list
    while current != nil
      to_s_string << "(#{current.value}) -> "
      current = current.next
    end 
    to_s_string << "nil"
    return to_s_string
  end 

  public
  def print_list 
    @current_node = @list
    while @current_node != nil 
      puts @current_node.value.to_s << " -> "
      @current_node = @current_node.next
    end 
  end 

  public 
  def insert_at(index, value)
    return false if index < 0 || index > self.size
    if index > 1 && index <= self.size
      replaced_node = self.at(index)
      new_node = Node.new 
      new_node.value = value
      new_node.next = replaced_node
      self.at(index-1).next = new_node
    else
      self.prepend(value)
    end 
    return true
  end 

  public 
  def remove_at(index)
    return false if index < 0 || index > self.size
    if index > 1 
      new_next_node = self.at(index+1)
      self.at(index-1).next = new_next_node
    else
      @list = @list.next
    end 
    return true
  end 
end 

class Node 
  
  attr_accessor :value 
  attr_accessor :next

  def initialize
    @value = nil
    @next = @nil
  end 

end 

