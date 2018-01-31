require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/BinarySearchTree.rb'

class BinarySearchTreeTest < Minitest::Test
  def test_binary_search_tree_initializes
    tree = BinarySearchTree.new()
    assert_instance_of BinarySearchTree, tree
    assert_nil tree.root
  end
  #
  # def test_create_node
  #   tree = BinarySearchTree.new()
  #   node = tree.create_node(61, "Bill")
  #   assert_equal 61, node.score
  #   assert_equal "Bill", node.movie_title
  # end

  def test_root_insert
    tree = BinarySearchTree.new()
    tree.insert(61, "bill")
    tree.insert(70, "fish")
    tree.insert(55, "test")
    tree.insert(56, "fourth")
    assert_equal 61, tree.root.score
    assert_equal "bill", tree.root.movie_title
    assert_equal 70, tree.root.right.score
    assert_equal "fish", tree.root.right.movie_title
    assert_equal 55, tree.root.left.score
    assert_equal "test", tree.root.left.movie_title
    assert_equal 56, tree.root.left.right.score
    assert_equal "fourth", tree.root.left.right.movie_title


    # binding.pry
  end

  # def test_install_right
  #   tree = BinarySearchTree.new()
  #   tree.insert(61, "bill")
  #   tree.insert(70, "cats")
  #   assert_equal 61, current.right.right
  # end
end
