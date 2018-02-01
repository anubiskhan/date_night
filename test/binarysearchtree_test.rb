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

  def test_root_insert
    tree = BinarySearchTree.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 61, tree.root.score
    assert_equal "Bill & Ted's Excellent Adventure", tree.root.movie_title
    assert_equal 16, tree.root.left.score
    assert_equal "Johnny English", tree.root.left.movie_title
    assert_equal 92, tree.root.right.score
    assert_equal "Sharknado 3", tree.root.right.movie_title
    assert_equal 50, tree.root.left.right.score
    assert_equal "Hannibal Buress: Animal Furnace", tree.root.left.right.movie_title
  end

  def test_install_right
    tree = BinarySearchTree.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(92, "Sharknado 3")

    assert_equal 61, tree.root.score
    assert_equal 92, tree.root.right.score
    refute tree.root.right.right
  end

  def test_include?
    tree = BinarySearchTree.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert tree.include?(16)
    refute tree.include?(72)
  end

  def test_depth_of?
    tree = BinarySearchTree.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, tree.depth_of?(92)
    assert_equal 2, tree.depth_of?(50)
    assert_equal nil, tree.depth_of?(99)
  end

  def test_max
    tree = BinarySearchTree.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    hash = {"Sharknado 3"=>92}

    assert_instance_of Hash, tree.max
    assert_equal hash, tree.max
  end

  def test_min
    tree = BinarySearchTree.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    hash = {"Johnny English"=>16}

    assert_instance_of Hash, tree.min
    assert_equal hash, tree.min
  end

  def test_sort
    tree = BinarySearchTree.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    sorted = [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]

    assert_instance_of Array, tree.sort
    assert_equal sorted, tree.sort
  end

  def test_load
    tree = BinarySearchTree.new()

    assert_equal 99, tree.load("./lib/movies.txt")
  end

  def test_health
    tree = BinarySearchTree.new()
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_instance_of Array, tree.health(0)
    assert_equal [[98, 7, 100]], tree.health(0)
    assert_equal [[58, 6, 85]], tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], tree.health(2)
  end
end
