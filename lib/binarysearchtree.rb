require 'pry'
require './lib/node.rb'

class BinarySearchTree
  attr_reader :root
  def initialize()
    @root = nil
  end
#Compare needs to compare against the lowest node, not the original node
  def insert(score, movie_title, compare = @root)
    current = Node.new(score, movie_title)
    if @root.nil?
      @root = current
    elsif score > compare.score
      install_right(current, compare)
    elsif score < compare.score
      install_left(current, compare)
    end
  end

  def install_right(current, compare)
    if compare.right.nil?
      compare.right = current
    else
      compare = compare.right
      insert(current.score, current.movie_title, compare)
    end
  end

  def install_left(current, compare)
    if compare.left.nil?
      compare.left = current
    else
      compare = compare.left
      insert(current.score, current.movie_title, compare)
    end
  end

  def include?(score)

  end
end
tree = BinarySearchTree.new
tree.insert(70, 'cats')
# p 'root established'
tree.insert(80, 'dogs')
tree.insert(90, 'stuff')
tree.insert(60, 'stuff')

#
# binding.pry
