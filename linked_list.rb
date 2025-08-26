require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize(value = nil)
    @head = value ? Node.new(value) : nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tail = self.tail 
      tail.next_node = Node.new(value)
    end
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size
    return 0 if @head.nil?
    size = 1
    current = @head
    while current.next_node != nil
      size += 1
      current = current.next_node
    end
    size
  end

  def head
    return @head
  end

  def tail
    return nil if @head.nil?
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    current
  end

  def at(index)
    return nil if @head.nil?
    current = @head
    if index >= self.size
      return nil
    else
      index.times do
        current = current.next_node
      end
      current
    end
  end

  def pop
    return nil if @head.nil?

    if @head.next_node .nil?
      old_head = @head
      @head = nil
      return old_head
    end
    new_tail = self.at(self.size - 2)
    old_tail = self.tail
    new_tail.next_node = nil
    return old_tail
  end

  def contains?(value)
    return nil if @head.nil?
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    return nil if @head.nil?  
    index = 0
    current = @head
    while current
      if current.value == value
        return index
      end
      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    return nil if @head.nil?
    current = @head
    string = ""
    while current
      string += "(#{current.value}) -> "
      current = current.next_node
    end
    string + "nil"
  end

  def insert_at(value, index)
    return "Error: Given index is beyond the size of the list" if index >= self.size
    current = @head
    if index == 0
      self.prepend(value)
    elsif index == 1
      new_node = Node.new(value, current.next_node)
      current.next_node = new_node
    else
      (index - 1).times do
        current = current.next_node
      end
      new_node = Node.new(value, current.next_node)
      current.next_node = new_node
    end
  end

  def remove_at(index)
    return "empty list" if @head.nil?
    if index == 0
      remove_node = current
      @head = @head.next_node
      return remove_node
    end
    current = @head
    (index - 1).times do
      current = current.next_node  
    end
    remove_node = current.next_node
    current.next_node = remove_node.next_node
    remove_node
  end

end