require 'spec_helper'

describe PriorityQueue do

  it 'is a real thing' do
    expect(PriorityQueue.new.is_a?(PriorityQueue)).to eq true
  end

end