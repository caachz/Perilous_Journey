require "./lib/linked_list"

class WagonTrain

  attr_reader :list

  def initialize
    @list = LinkedList.new
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
    total_supplies
  end

  def go_hunting
    random_number = rand(5)
    game_got = []
    potential_game = [{"squirrel" => 2}, {"deer" => 40}, {"bison" => 100}]
    random_number.times do
      game_got << potential_game[rand(3)]
    end
    total_squirrels = game_got.count({"squirrel" => 2})
    how_say_squirrle = "squirrel"
    total_deer = game_got.count({"deer" => 40})
    total_bison = game_got.count({"bison" => 100})
    if total_squirrels > 1
      how_say_squirrle = "squirrels"
    end
    total_food_from_game = {"pounds of food" => 0}
    total_food_from_game["pounds of food"] = (total_squirrels * 2) + (total_deer * 40) + (total_bison * 100)
    @list.head.supplies = list.head.supplies.merge(total_food_from_game) {|key, oldval, newval| newval + oldval}
    "You got #{total_squirrels} #{how_say_squirrle}, #{total_deer} deer and #{total_bison} bison for #{total_food_from_game["pounds of food"]} pounds of food"
  end
end
