require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/BinarySearchTree.rb'

class BinarySearchTreeTest < Minitest::Test
  def test_binary_search_tree_initializes
    btree = BinarySearchTree.new()
    assert_instance_of BinarySearchTree, btree
    assert_nil btree.root
  end
  #
  # def test_create_node
  #   btree = BinarySearchTree.new()
  #   node = btree.create_node(61, "Bill")
  #   assert_equal 61, node.score
  #   assert_equal "Bill", node.movie_title
  # end

  def test_root_insert
    btree = BinarySearchTree.new()
    btree.insert(61, "bill")
    assert_equal 61, btree.root.score
    assert_equal "bill", btree.root.movie_title
  end

  # def test_install_right
  #   btree = BinarySearchTree.new()
  #   btree.insert(61, "bill")
  #   btree.insert(70, "cats")
  #   assert_equal 61, current.right.right
  # end
end
