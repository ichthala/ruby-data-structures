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

end
