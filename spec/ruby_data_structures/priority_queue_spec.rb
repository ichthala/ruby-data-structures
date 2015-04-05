require 'spec_helper'

describe PriorityQueue do

  describe '::new' do

    it 'inserts events' do
      events = {
        '8' => 'Tennis Court Oath',
        '10' => 'Bastille Day',
        '18' => 'Reign of Terror'
      }

      expect_any_instance_of(PriorityQueue).to receive(:insert).with('8', 'Tennis Court Oath')
      expect_any_instance_of(PriorityQueue).to receive(:insert).with('10', 'Bastille Day')
      expect_any_instance_of(PriorityQueue).to receive(:insert).with('18', 'Reign of Terror')

      PriorityQueue.new events
    end

    context 'when a non-Hash argument is passed' do
      it 'raises an ArgumentError' do
        expect { PriorityQueue.new(['l', 'o', 'l']) }.to raise_error
      end
    end

    context 'when no arguments are passed' do
      it 'does not raise an error' do
        expect { PriorityQueue.new }.not_to raise_error
      end
    end

  end

  describe '#min' do

    it 'returns the highest priority event' do
      queue = PriorityQueue.new
      queue.instance_eval { @queue = [1, 2, 3] }
      expect(queue.min).to eq 1
    end

  end

  describe '#insert' do

    context 'when the queue is empty' do

      it 'inserts the key-value pair as min'

    end

    context 'when the queue is not empty' do

      it 'bubbles the key-value pair to the correct position'

    end

  end

end
