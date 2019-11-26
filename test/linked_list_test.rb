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

    assert_equal 2, list
  end
end
