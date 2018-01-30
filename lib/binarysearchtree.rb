require 'pry'

class BinarySearchTree
  attr_reader :root
  def initialize()
    @root = nil
  end

  def create_node(score, movie_title)
    Node.new(score, movie_title)
  end

  def insert(score, movie_title, compare = @root)
    binding.pry
    if @root.nil?
      @root = create_node(score, movie_title)
    elsif score > compare.score
      install_right?(compare)
    elsif score < compare.score
      install_left?(compare)
    end
  end

  def install_right?(current)
    if current.right?
      insert(score, movie_title, current.right)
    else
      current.right = create_node(score, movie_title)
    end
  end

  def install_left?(current)
    if current.left?
      insert(score, movie_title, current.left)
    else
      current.left = create_node(score, movie_title)
    end
  end

end
