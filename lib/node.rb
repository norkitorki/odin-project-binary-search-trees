# frozen_string_literal: true

# binary tree node class
class Node
  attr_accessor :left, :data, :right

  def initialize(data)
    @left  = nil
    @data  = data
    @right = nil
  end
end
