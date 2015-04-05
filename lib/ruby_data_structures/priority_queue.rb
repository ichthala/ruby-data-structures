class PriorityQueue

  def initialize events={}
    raise ArgumentError, 'Events must be passed to the priority queue as a hash' unless events.is_a?(Hash)

    @queue = []
    events.each { |k,v| insert(k, v)}
  end

  def insert k, v
    # event = Struct.new :k, :v
    # event.k = k.to_i
    # event.v = v

    # queue << event
    # index = queue[-1]
  end


  def min
    queue[0]
  end

  private

  attr_reader :queue

end
