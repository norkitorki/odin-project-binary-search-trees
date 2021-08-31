require_relative '../lib/node'

describe Node do
  it 'should initialize with a value and assign it to its data attribute' do
    NODE = Node.new(10)
    expect(NODE.data).to eq(10)
  end

  it 'should be able to assign and access its left and right child node' do
    NODE.left  = LEFT_CHILD  = Node.new(5)
    NODE.right = RIGHT_CHILD = Node.new(20)
    expect(NODE.left).to eq(LEFT_CHILD)
    expect(NODE.right).to eq(RIGHT_CHILD)
  end
end
