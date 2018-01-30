class Node
  attr_reader :score, :movie_title
  attr_accessor :left, :right
  def initialize(score, movie_title)
    @score = score
    @movie_title = movie_title
    @left = nil
    @right = nil
  end
end
