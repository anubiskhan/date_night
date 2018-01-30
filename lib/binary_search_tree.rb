class BinaryTree
  def initialize(key, value)
    @root = nil
    @current_node = nil
    @depth = 0
  end

  def insert(key, value)
    if @root == nil
      @root = Node.new(key, value, depth)
      @current_node = @root
    elsif key > @current_node.key
      direction(right)
    elsif key < @current_node.key
      direction(left)
    end
  end

  def direction(dir)
    if @current_node.dir.has_node?
      @current_node = @current_node.dir
    else
      @current_node.right = Node.new(key, value, depth)
    end
  end
end

class Node
  attr_reader :key, :value
  attr_accessor :left, :right, :depth
  def initialize(key, value)
    @key = key
    @value = value
    @depth = 0
    @left = nil
    @right = nil
  end
end
