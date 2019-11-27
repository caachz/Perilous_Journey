require "./lib/linked_list"

class WagonTrain

  attr_reader :list, :supplies

  def initialize
    @list = LinkedList.new
    @supplies = {}
  end

  def append(surname, supplies_purchased = {})
    new_family = list.append(surname)
    new_family.supplies = supplies_purchased
    new_family
  end

  def count
    list.count
  end

  def supplies
    mover = list.head
    total_supplies = {}
    until mover == nil
      total_supplies = total_supplies.merge(mover.supplies){|key, oldval, newval| newval + oldval}
      mover = mover.next_node
    end
    @supplies = total_supplies
  end

  def go_hunting
    animals = [{"squirrel" => [2]}, {"deer" => [40]}, {"bison" => [100]}]
    animals_hunted = []
    total_animals_hunted = rand(5)
    total_food = {}
    output = ""
    require "pry"; binding.pry
    total_animals_hunted.times do
      animals_hunted << animals[rand(2)]
    end
    animals_hunted.each do |animal|
      total_food = total_food.merge(animal) {|key, oldval1, newval1| newval1 + oldval1}
    end
    if total_food["squirrel"] != nil && total_food["squirrel"].length > 1
      total_food["squirrels"] = total_food.delete("squirrel")
    end
    sum_of_all_food = 0
    total_food.each do |food|
      if food == total_food.first
        sum_of_all_food = sum_of_all_food + (food[1].length * food[1][0])
        output = "You got #{food[1].length} #{food[0]} "
      elsif food[0] == total_food.keys.last
        sum_of_all_food = sum_of_all_food + (food[1].length * food[1][0])
        output = output + "and #{food[1].length} #{food[0]} for #{sum_of_all_food} pounds of food"
      else
        sum_of_all_food = sum_of_all_food + (food[1].length * food[1][0])
        output = output + ", #{food[1].length} #{food[0]}"
      end
    end
    if @supplies["pounds of food"] == nil
      @supplies["pounds of food"] = sum_of_all_food
    else
      @supplies["pounds of food"] = @supplies["pounds of food"] + sum_of_all_food
    end
    p output
  end
end
