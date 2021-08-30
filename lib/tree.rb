# frozen_string_literal: true

require_relative 'node'

# balanced binary search tree class
class Tree
  attr_reader :root

  def initialize(array)
    @root  = build_tree(array.sort.uniq)
  end

  def insert(value)
    return 'node already exists' if find(value)

    new_node = Node.new(value)
    find(value) do |node|
      return node.left = new_node if node.left.nil? && node.data > value
      return node.right = new_node if node.right.nil? && node.data < value
    end
  end

  def delete(value)
    raise StandardError, 'node could not be found' unless find(value)

    values = inorder.reject { |v| v == value }
    @root = build_tree(values)
    value
  end

  def find(value)
    node = root
    until node.nil? || node.data == value
      yield node if block_given?
      node = node.data > value ? node.left : node.right
    end
    node
  end

  def level_order(node = root)
    queue  = [node]
    values = []
    until queue.empty?
      node = queue.shift
      values << node.data
      queue << node.left if node.left
      queue << node.right if node.right
    end
    values
  end

  def level_order_recursive(queue = [root])
    return [] if queue.empty?

    node = queue.shift
    queue << node.left if node.left
    queue << node.right if node.right

    [node.data] + level_order_recursive(queue)
  end

  def preorder(node = root)
    node ? [node.data] + preorder(node.left) + preorder(node.right) : []
  end

  def inorder(node = root)
    node ? inorder(node.left) + [node.data] + inorder(node.right) : []
  end

  def postorder(node = root)
    node ? postorder(node.left) + postorder(node.right) + [node.data] : []
  end

  def height(node = root)
    return -1 unless node

    left_height  = height(node.left)
    right_height = height(node.right)
    left_height > right_height ? left_height + 1 : right_height + 1
  end

  def depth(node)
    return unless node

    depth = 0
    find(node.data) { depth += 1 }
    depth
  end

  def depth_recursive(node, root = self.root)
    return 0 if node.nil? || root == node

    1 + depth_recursive(node, node.data <= root.data ? root.left : root.right)
  end

  def balanced?
    (height(root.left) - height(root.right)).abs <= 1
  end

  def rebalance
    @root = build_tree(inorder)
  end

  private

  def build_tree(array)
    return if array.empty?

    mid  = ((array.length - 1) / 2).floor
    node = Node.new(array[mid])

    node.left  = build_tree(array[0...mid])
    node.right = build_tree(array[mid + 1..-1])
    node
  end
end