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
      it 'creates a queue with a nil value at index 0' do
        pq = PriorityQueue.new
        expect(pq.instance_eval { queue[0] }).to eq nil
      end
    end

  end

  describe '#min' do

    it 'returns the event at index 1' do
      pq = PriorityQueue.new
      pq.instance_eval { @queue = [1, 2, 3] }
      expect(pq.min).to eq 2
    end

  end

  describe '#insert' do

    context 'when the queue is empty' do

      it 'inserts the key-value pair as min' do
        pq = PriorityQueue.new
        pq.insert('22', 'Marie Antoinette executed')

        expect(pq.min.v).to eq 'Marie Antoinette executed'
      end

    end

    context 'when the queue is not empty' do

      it 'bubbles the key-value pair to the correct position' do
        pq = PriorityQueue.new({
          '22' => 'Marie Antoinette executed',
          '18' => 'Reign of Terror',
          '10' => 'Bastille Day'
        })

        pq.insert('8', 'Tennis Court Oath')
        expect(pq.min.v).to eq 'Tennis Court Oath'
      end

    end

  end

  describe '#remove_min' do

    it 'returns the minimum' do
      pq = PriorityQueue.new({
        '22' => 'Marie Antoinette executed',
        '18' => 'Reign of Terror',
      })

      expect(pq.remove_min.v).to eq('Reign of Terror')
    end

    it 'resets the queue' do
      pq = PriorityQueue.new({
        '22' => 'Marie Antoinette executed',
        '18' => 'Reign of Terror',
        '10' => 'Bastille Day',
        '8' => 'Tennis Court Oath'
      })

      pq.remove_min
      expect(pq.remove_min.v).to eq('Bastille Day')
      expect(pq.remove_min.v).to eq('Reign of Terror')
      expect(pq.remove_min.v).to eq('Marie Antoinette executed')
    end

  end

end
