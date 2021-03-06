require 'pry'
require './lib/node.rb'

class BinarySearchTree
  attr_reader :root
  def initialize()
    @root = nil
  end

  def insert(score, movie_title, current_node = @root)
    node = Node.new(score, movie_title)
    if @root.nil?
      @root = node
    elsif score > current_node.score
      install_right(node, current_node)
    elsif score < current_node.score
      install_left(node, current_node)
    end
  end

  def install_right(node, current_node)
    if current_node.right.nil?
      current_node.right = node
    else
      insert(node.score, node.movie_title, current_node.right)
    end
  end

  def install_left(node, current_node)
    if current_node.left.nil?
      current_node.left = node
    else
      insert(node.score, node.movie_title, current_node.left)
    end
  end

  def include?(score, current_node = @root)
    if @root.nil?
      false
    elsif score > current_node.score
      if current_node.right.nil?
        false
      else
        include?(score, current_node.right)
      end
    elsif score < current_node.score
      if current_node.left.nil?
        false
      else
        include?(score, current_node.left)
      end
    else
      true
    end
  end

  def depth_of?(score, current_node = @root, depth = 0)
    if @root.nil? or score == current_node.score
      depth
    elsif score > current_node.score
      if current_node.right.nil?
        nil
      else
        depth_of?(score, current_node.right, depth += 1)
      end
    elsif score < current_node.score
      if current_node.left.nil?
        nil
      else
       depth_of?(score, current_node.left, depth += 1)
      end
    end
  end

  def max(current_node = @root)
    if current_node.nil?
      {}
    elsif current_node.right.nil?
      {current_node.movie_title => current_node.score}
    else
      max(current_node.right)
    end
  end

  def min(current_node = @root)
    if current_node.nil?
      {}
    elsif current_node.left.nil?
      {current_node.movie_title => current_node.score}
    else
      min(current_node.left)
    end
  end

  def sort(current_node=@root, sorted=[])
     sort(current_node.left, sorted) if current_node.left
     sorted.push({current_node.movie_title => current_node.score})
     sort(current_node.right, sorted) if current_node.right
     sorted
  end

  def load(file_name)
    movies_inserted = 0
    File.open(file_name) do |file|
      file.read.split("\n").each do |line|
          movies_inserted += 1
          parts = line.split(',')
          score = parts.shift.to_i
          title = parts.join(',')
          insert(score, title)
      end
    end
    movies_inserted
  end

  def health(target_depth = 0)
    health_array = []
    nodes_array = sort.map do |element|
      {element.values[0] => depth_of?(element.values[0])}
    end
    nodes_array.each do |value|
      if value.values[0] == target_depth
        health_array.push(health_array_builder(value.keys[0]))

      end
    end
    health_array
  end

  def health_array_builder(score)
    total_nodes = sort.length
    #needs to find node using score then pass score_node into node_child_count
    node_child_count = sort(score).length
    health_percent = ((node_child_count/total_nodes).to_f * 100).to_i
    health_array.push([current_node.score, node_child_count, health_percent])
  end
end
