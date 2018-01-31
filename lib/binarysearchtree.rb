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
      binding.pry
      install_right(score, movie_title)
    elsif score < compare.score
      install_left(current)
    end
  end

  def install_right(score, movie_title)
    if current.right.nil?
      binding.pry
      insert(score, movie_title)
    else
      current.right = current
    end
  end

  def install_left(current)
    if current.left.nil?
      insert(current.score, current.movie_title, compare.left)
      binding.pry
    else
      compare.left = current
    end
  end

  def include?(score)

  end
end
btree = BinarySearchTree.new
btree.insert(70, 'cats')
p 'root established'
btree.insert(80, 'dogs')
puts 'second node established'
#
# binding.pry
