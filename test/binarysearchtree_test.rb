require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/BinarySearchTree.rb'

class BinarySearchTreeTest < Minitest::Test
  def test_binary_search_tree_initializes
    btree = BinarySearchTree.new()
    assert_equal btree.root, nil
  end

  def test_create_node
    btree = BinarySearchTree.new()
  end
end
