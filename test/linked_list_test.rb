require "minitest/autorun"
require "minitest/pride"
require "./lib/node"
require "./lib/linked_list.rb"

class LinkedListTest < Minitest::Test

  def test_it_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_it_has_a_head
    list = LinkedList.new

    assert_nil list.head
  end

  def test_append_creates_a_node_object
    list = LinkedList.new
    assert_instance_of Node, list.append("West")
    assert_instance_of LinkedList, list
  end

  def test_next_node_returns_nil
    list = LinkedList.new
    list.append("West")
    assert_nil list.head.next_node
  end

  def test_it_can_count
    list = LinkedList.new
    list.append("West")

    assert_equal 1, list.count
  end

  def test_list_is_a_family
    list = LinkedList.new
    list.append("West")
    assert_equal "The West family", list.to_string
  end

  def test_it_can_have_multiple_nodes
    list = LinkedList.new
    family_rhodes = list.append("Rhodes")
    family_hardy = list.append("Hardy")

    assert_equal family_hardy, family_rhodes.next_node
  end

  def test_new_family_can_be_prepended
    list = LinkedList.new
    family_brooks = list.append("Brooks")
    family_henderson = list.append("Henderson")
    family_mckinney = list.prepend("McKinney")
    assert_equal family_brooks, family_mckinney.next_node
  end

  def test_it_can_print_out_wagon_travel_chain_as_string
    list = LinkedList.new
    family_brooks = list.append("Brooks")
    family_henderson = list.append("Henderson")
    family_mckinney = list.prepend("McKinney")

    assert_equal"The McKinney family, followed by the Brooks family, followed by the Henderson family", list.to_string
  end

  def test_it_can_count_multiple_familys
    list = LinkedList.new
    family_brooks = list.append("Brooks")
    family_henderson = list.append("Henderson")
    family_mckinney = list.prepend("McKinney")

    assert_equal 3, list.count
  end

  def test_new_family_can_be_inserted_anywhere
    list = LinkedList.new
    family_brooks = list.append("Brooks")
    family_henderson = list.append("Henderson")
    family_mckinney = list.prepend("McKinney")
    family_lawson = list.insert(1, "Lawson")

    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family", list.to_string
  end

  def test_it_can_insert_new_family_in_a_second_location
    list = LinkedList.new
    family_brooks = list.append("Brooks")
    family_henderson = list.append("Henderson")
    family_mckinney = list.prepend("McKinney")
    family_lawson = list.insert(2, "Lawson")

    assert_equal "The McKinney family, followed by the Brooks family, followed by the Lawson family, followed by the Henderson family", list.to_string
  end

  def test_it_has_a_find_function
    list = LinkedList.new
    family_brooks = list.append("Brooks")
    family_henderson = list.append("Henderson")
    family_mckinney = list.prepend("McKinney")
    family_lawson = list.insert(1, "Lawson")

    assert_equal "The Brooks family", list.find(2, 1)
    assert_equal "The Lawson family, followed by the Brooks family, followed by the Henderson family", list.find(1, 3)
  end

  def test_it_can_include_a_variable
    list = LinkedList.new
    family_brooks = list.append("Brooks")
    family_henderson = list.append("Henderson")
    family_mckinney = list.prepend("McKinney")
    family_lawson = list.insert(1, "Lawson")

    assert_equal true, list.includes?("Brooks")
    assert_equal false, list.includes?("Chapman")
  end

  def test_a_family_can_die_from_disentry
    list = LinkedList.new
    family_brooks = list.append("Brooks")
    family_henderson = list.append("Henderson")
    family_mckinney = list.prepend("McKinney")
    family_lawson = list.insert(1, "Lawson")

    assert_equal 'The Henderson family has died of dysentery', list.pop
    assert_equal 'The Brooks family has died of dysentery', list.pop
    assert_equal "The McKinney family, followed by the Lawson family", list.to_string
  end
end
