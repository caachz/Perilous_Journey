require "./lib/node"

class LinkedList

  attr_reader :head

  def initialize
    @head = head
    @count = 0
  end

  def append(surname)
    @count += 1
    if @head == nil
      @head = Node.new(surname)
    else
      @head.next_node = Node.new(surname)
    end
  end

  def count
    @count
  end

  def to_string
    if @head.next_node == nil
      "The #{@head.surname} family"
    else
      "The #{@head.surname} family, followed by the #{@head.next_node.surname} family."
    end
  end
end
