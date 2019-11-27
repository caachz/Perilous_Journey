require "./lib/node"

class LinkedList

  attr_reader :head

  def initialize
    @head = head
  end

  def append(surname)
    if @head == nil
      @head = Node.new(surname)
    else
      @head.next_node = Node.new(surname)
    end
  end

  def prepend(surname, supplies = {})
    if @head != nil
      new_head = Node.new(surname, supplies)
      new_head.next_node = @head
      @head = new_head
    end
  end

  def insert(position, surname, supplies = {})
    mover = @head
    output = @head
    count = 0
    new_family = Node.new(surname, supplies)
    until mover == nil
      if count == position
        new_family.next_node = mover
        if count == 1
          output.next_node = new_family
        elsif count == 2
          output.next_node.next_node = new_family
        elsif count == 3
          output.next_node.next_node.next_node = new_family
        elsif count == 4
          output.next_node.next_node.next_node.next_node = new_family
        elsif count == 5
          output.next_node.next_node.next_node.next_node.next_node = new_family
        end
        break
      end
      count += 1
      mover = mover.next_node
    end
    @head = output
  end

  def count
    count = 0
    mover = @head
    until mover == nil
      count += 1
      mover = mover.next_node
    end
    count
  end

  def to_string
    string = "The #{@head.surname} family"
    mover = head.next_node
    until mover == nil
      string = string + ", followed by the #{mover.surname} family"
      mover = mover.next_node
    end
    string
  end

  def find(return_position, number_of_elements)
    mover = @head
    counter = 0
    until mover == nil
      if counter == return_position - 1
        if number_of_elements == 1
          return "The #{mover.next_node.surname} family"
        elsif number_of_elements == 2
          return "The #{mover.next_node.surname} family, followed by the #{mover.next_node.next_node.surname} family"
        elsif number_of_elements == 3
          return "The #{mover.next_node.surname} family, followed by the #{mover.next_node.next_node.surname} family, followed by the #{mover.next_node.next_node.next_node.surname} family"
        end
      end
      counter += 1
      mover = mover.next_node
    end
  end

  def includes?(search_key)
    mover = @head
    counter = 0
    status = false
    until mover == nil
      if mover.surname == search_key
        status = true
      end
    counter += 1
    mover = mover.next_node
    end
    status
  end

  def pop
    mover = @head
    counter = 0
    family = nil
    until mover == nil
      if mover.next_node.next_node == nil
        family = mover.next_node
        mover.next_node = nil
        break
      end
      counter += 1
      mover = mover.next_node
    end
    puts string = "The #{family.surname} family has died of dysentery"
    family
  end
end
