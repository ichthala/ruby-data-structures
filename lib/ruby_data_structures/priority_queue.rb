require 'pry'
class PriorityQueue

  Event = Struct.new(:k, :v)

  def initialize events={}
    raise ArgumentError, 'Events must be passed to the priority queue as a hash' unless events.is_a?(Hash)

    @queue = [nil]
    events.each { |k,v| insert(k, v)}
  end

  # TODO: Should support a hash argument as well
  def insert k, v
    # TODO: Make key comparison more generic
    event = Event.new k.to_i, v

    queue << event
    index = queue.length - 1
    parent_index = index/2

    while (index > 1) && (queue[index].k < queue[parent_index].k)
      swap(index, parent_index)
      index = parent_index
      parent_index = index/2
    end
  end

  def min
    queue[1]
  end

  private

  def swap index1, index2
    temp = queue[index1]
    queue[index1] = queue[index2]
    queue[index2] = temp
  end

  attr_reader :queue

end
