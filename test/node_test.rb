require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < Minitest::Test
  def test_node_initializes
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_equal node.score, 61
    assert_equal node.movie_title, "Bill & Ted's Excellent Adventure"
    assert_equal node.left, nil
    assert_equal node.right, nil
  end
end
