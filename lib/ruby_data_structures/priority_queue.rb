require 'pry'
class PriorityQueue

  Event = Struct.new(:k, :v)

  def initialize events = {}
    raise ArgumentError, 'Events must be passed to the priority queue as a hash' unless events.is_a?(Hash)

    @queue = [nil]
    events.each { |k,v| insert(k, v)}
  end

  # TODO: Should support a hash argument as well
  def insert k, v
    # TODO: Make key comparison more generic
    event = Event.new k.to_i, v

    queue << event
    index = max_index
    parent_index = index/2

    while (index > 1) && (queue[index].k < queue[parent_index].k)
      swap(index, parent_index)
      index = parent_index
      parent_index = index/2
    end
  end

  def remove_min
    current_min = min
    reset_queue
    current_min
  end

  def min
    queue[1]
  end

  private

  # TODO: Refactor
  def reset_queue
    max_event = queue[max_index]
    queue.pop
    index = 1
    queue[index] = max_event
    child1 = queue[index * 2]
    child2 = queue[index * 2 + 1]

    while (child1 && (max_event.k > child1.k)) || (child2 && (max_event.k > child2.k))
      min_child_index = if child1.k < child2.k
        index * 2
      else
        index * 2 + 1
      end
      swap(index, min_child_index)

      index = min_child_index
      child1 = queue[index * 2]
      child2 = queue[index * 2 + 1]
    end
  end

  def swap index1, index2
    temp = queue[index1]
    queue[index1] = queue[index2]
    queue[index2] = temp
  end

  def max_index
    queue.length - 1
  end

  attr_reader :queue

end
