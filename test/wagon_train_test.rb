require "minitest/autorun"
require "minitest/pride"
require "./lib/linked_list"
require './lib/wagon_train'

class WagonTrainTest < Minitest::Test
  def test_it_exists
    wt = WagonTrain.new

    assert_instance_of WagonTrain, wt
  end

  def test_it_has_a_list
    wt = WagonTrain.new

    assert_instance_of LinkedList, wt.list
  end

  def test_list_starts_with_nothing
    wt = WagonTrain.new

    assert_nil wt.list.head
  end

  def test_a_family_can_be_added
    wt = WagonTrain.new

    assert_instance_of Node, wt.append("Burke")
  end

  def test_the_head_of_the_list_has_a_surname
    wt = WagonTrain.new
    wt.append("Burke")

    assert_equal "Burke", wt.list.head.surname
  end

  def test_more_than_one_family_can_be_in_wagon_train
    wt = WagonTrain.new
    wt.append("Burke")

    assert_instance_of Node, wt.append("West")
  end

  def test_it_can_count_number_of_families
    wt = WagonTrain.new
    wt.append("Burke")
    wt.append("West")

    assert_equal 2, wt.count
  end

  def test_it_can_carry_supplies
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})
    supplies = {"pounds of food" => 200}

    assert_equal supplies, wt.list.head.supplies
  end

  def test_it_can_carry_supplies_when_family_is_prepended
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})
    new_family = wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
    supplies = {"spare wagon tongues" => 3}

    assert_equal supplies, new_family.supplies
  end

  def test_a_family_that_is_inserted_has_supplies
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})
    wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
    new_family = wt.list.insert(1, "West", {"pounds of food" => 300})
    supplies = {"pounds of food" => 300}

    assert_equal "West", wt.list.head.next_node.surname
    assert_equal supplies, wt.list.head.next_node.supplies
  end

  def test_a_wagon_train_has_supplies
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})
    wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
    wt.list.insert(1, "West", {"pounds of food" => 300})
    supplies = {"spare wagon tongues" => 3, "pounds of food" => 500}

    assert_equal supplies, wt.supplies
  end

end
