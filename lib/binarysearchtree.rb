require 'pry'
require './lib/node.rb'

class BinarySearchTree
  attr_reader :root
  def initialize()
    @root = nil
  end

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
      insert(current.score, current.movie_title)
    end
  end

  def install_left(current, compare)
    if compare.left.nil?
      compare.right = current
    else
      insert(current.score, current.movie_title)
    end
  end

  def include?(score)

  end
end
# btree = BinarySearchTree.new
# btree.insert(70, 'cats')
# p 'root established'
# btree.insert(80, 'dogs')
# puts 'second node established'
# puts btree.compare
#
# binding.pry
