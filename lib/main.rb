# frozen_string_literal: true

require_relative 'tree'

ARRAY = Array.new(15) { rand(0..100) }

# create a binary search tree from a random array of integers
TREE = Tree.new(ARRAY)

# confirm that the tree is balanced
puts 'Is the tree balanced?'
puts "-> #{TREE.balanced?}\n\n"

# print out the tree in pre-order,in-order and post-order
puts 'Tree printed out in:'
puts "pre-order  -> #{TREE.preorder.join(', ')}"
puts "in-order   -> #{TREE.inorder.join(', ')}"
puts "post-order -> #{TREE.postorder.join(', ')}\n\n"

# unbalance the tree by adding ~10 integers between 100 and 500
integers = Array.new(5) { rand(100..300) }.uniq
puts 'Unbalancing the tree by inserting: ' \
  "#{integers.map { |i| TREE.insert(i).data }.join(', ')}\n\n"

# confirm that the tree is now unbalanced
puts 'Is the tree unbalanced?'
puts "-> #{!TREE.balanced?}\n\n"

# rebalance the tree
puts "Rebalancing the tree...\n\n"
TREE.rebalance

# confirm that the tree is balanced again
puts 'Did we succeed? Is the tree balanced again?'
puts "-> #{TREE.balanced?}\n\n"

# print out the tree in level-order,pre-order,in-order and post-order
puts 'Tree printed out in:'
puts "level-order -> #{TREE.level_order.join(', ')}"
puts "pre-order   -> #{TREE.preorder.join(', ')}"
puts "in-order    -> #{TREE.inorder.join(', ')}"
puts "post-order  -> #{TREE.postorder.join(', ')}\n\n"
