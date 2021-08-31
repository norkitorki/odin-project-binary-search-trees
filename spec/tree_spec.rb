require_relative '../lib/tree'

describe Tree do
  it 'should initialize a binary search tree from an array' do
    array = [12, 74, 23, 5, 104, 2, 44, 81]
    TREE = Tree.new(array)
    expect(TREE.root.data).to eq(23)
  end

  context 'find' do
    it 'should find a node' do
      expect(TREE.find(23)).to be_a(Node)
    end

    it 'should return nil if the node is not found' do
      expect(TREE.find(4)).to eq(nil)
    end

    it 'should yield each node on its way to the target node' do
      nodes = []
      TREE.find(2) { |node| nodes << node.data }
      expect(nodes).to eq([23, 5, 2])
    end
  end

  context 'insert' do
    it 'should insert a new node' do
      TREE.insert(-4)
      expect(TREE.find(-4).data).to eq(-4)
    end

    it 'should return an error message when the node already exists' do
      expect(TREE.insert(44)).to eq('node already exists')
    end
  end

  context 'delete' do
    it 'should delete a node' do
      TREE.delete(2)
      expect(TREE.find(2)).to eq(nil)
    end
  end

  context 'level_order' do
    it 'should return an array with node values in level-order' do
      expect(TREE.level_order).to eq([23, 5, 74, -4, 12, 44, 81, 104])
    end
  end

  context 'level_order_recursive' do
    it 'should recursively return an array with node values in level-order' do
      expect(TREE.level_order_recursive).to eq([23, 5, 74, -4, 12, 44, 81, 104])
    end
  end

  context 'preorder' do
    it 'should return an array with node values in pre-order' do
      expect(TREE.preorder).to eq([23, 5, -4, 12, 74, 44, 81, 104])
    end
  end

  context 'inorder' do
    it 'should return an array with node values in in-order' do
      expect(TREE.inorder).to eq([-4, 5, 12, 23, 44, 74, 81, 104])
    end
  end

  context 'postorder' do
    it 'should return an array with node values in post-order' do
      expect(TREE.postorder).to eq([-4, 12, 5, 44, 104, 81, 74, 23])
    end
  end

  context 'height' do
    it 'should return the height of the tree' do
      expect(TREE.height).to eq(3)
    end
  end

  context 'depth' do
    it 'should return the depth of a node' do
      expect(TREE.depth(TREE.find(23))).to eq(0)
      expect(TREE.depth(TREE.find(104))).to eq(3)
    end
  end

  context 'depth_recursive' do
    it 'should recursively return the depth of a node' do
      expect(TREE.depth_recursive(TREE.find(-4))).to eq(2)
      expect(TREE.depth_recursive(TREE.find(104))).to eq(3)
    end
  end

  context 'balanced?' do
    it 'should determine if the tree is balanced' do
      expect(TREE.balanced?).to eq(true)
      TREE.insert(150)
      expect(TREE.balanced?).to eq(false)
    end
  end

  context 'rebalance' do
    it 'should rebalance the tree' do
      TREE.insert(204)
      TREE.insert(1000)
      expect(TREE.balanced?).to eq(false)
      TREE.rebalance
      expect(TREE.balanced?).to eq(true)
    end
  end
end
