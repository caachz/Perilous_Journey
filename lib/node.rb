class Node
  attr_reader :surname
  attr_accessor :next_node, :supplies

  def initialize(surname, supplies = {})
    @surname = surname
    @next_node = nil
    @supplies = supplies
  end
end
