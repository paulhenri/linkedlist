# frozen_string_literal: true

require 'linkedlist'
describe LinkedList do
  describe '.initialize' do
    context 'Initialize a list with a value' do
      it 'should be readable on the @list.value reader' do
        tlist = LinkedList.new(3)
        expect(tlist.list.value).to eq(3)
      end
    end
  end

  describe '.tail' do
    context 'Given a list with 1 node' do
      it 'should output the value of the first node' do
        tlist = LinkedList.new(3)
        expect(tlist.tail.value).to eq(3)
      end
    end

    context 'Given a list with more than 1 node' do
      it 'should output the value of the last inserted node' do
        tlist = LinkedList.new(5)
        last_inserted = 0
        (1..rand(1..50)).each do |_i|
          last_inserted = rand(1..100)
          tlist.append(last_inserted)
        end
        expect(tlist.tail.value).to eq(last_inserted)
      end
    end
  end

  describe '.head' do
    context 'Given a list with one value' do
      it 'should return the value of the first node ' do
        tlist = LinkedList.new(5)
        expect(tlist.head.value).to eq(5)
      end
    end
    context 'Given a list with multiple value' do
      it 'should return the value of the first node' do
        tlist = LinkedList.new(5)
        last_inserted = 0
        (1..rand(1..50)).each do |_i|
          last_inserted = rand(1..100)
          tlist.append(last_inserted)
        end
        expect(tlist.head.value).to eq(5)
      end
    end

    context 'Given a list, after a random number of call to .prepend' do
      it 'should return the last value prepended' do
        tlist = LinkedList.new(5)
        last_inserted = 0
        (1..rand(1..50)).each do |_i|
          last_inserted = rand(1..100)
          tlist.prepend(last_inserted)
        end
        expect(tlist.head.value).to eq(last_inserted)
      end
    end
  end

  describe '.prepend' do
    context 'Given a list' do
      it 'should place the value in front of the list' do
        tlist = LinkedList.new(3)
        tlist.prepend(5)
        expect(tlist.head.value).to eq(5)
        expect(tlist.tail.value).to eq(3)
      end
    end
  end

  describe '.append' do
    context 'Append a value to a list' do
      it 'tail should be eq to the value' do
        tlist = LinkedList.new(3)
        tlist.append(8)
        expect(tlist.tail.value).to eq(8)
      end
    end
  end

  describe '.at' do
    context 'Given a list initialized with a random number of nodes' do
      it 'should return a valid node if index is between boundaries' do
        # We use a hash to store values and position of nodes pos => value
        tlist = LinkedList.new(1)
        nb_values = rand(10..100)
        (2..nb_values).each do |i|
          tlist.append(i)
        end
        hazard_test = rand(nb_values)
        expect(tlist.at(hazard_test).class).to eq(Node)
      end

      it 'should return a nil value if index is 0 or out of bound' do
        tlist = LinkedList.new(1)
        nb_values = rand(10..100)
        (2..nb_values).each do |i|
          tlist.append(i)
        end
        hazard_test = nb_values + 10
        expect(tlist.at(hazard_test)).to eq(nil)
      end
    end
  end

  describe '.pop' do
    context 'Given a list initialized with 2+ values' do
      it 'should delete the last value' do
        tlist = LinkedList.new(1)
        tlist.append(2)
        tlist.append(3)
        tlist.pop
        expect(tlist.tail.value).to eq(2)
      end
    end
    context 'Given a list with 1 value' do
      it 'should do nothing' do
        tlist = LinkedList.new(1)
        tlist.pop
        expect(tlist.tail.value).to eq(1)
      end
    end
  end

  describe '.contains?' do
    context 'Given a list with a node containing 1, 2, 3' do
      it 'should return true when called with argument 3' do
        tlist = LinkedList.new(1)
        tlist.append(2)
        tlist.append(3)
        expect(tlist.contains?(3)).to eq(true)
      end
      it 'should return false when called with argument 6' do
        tlist = LinkedList.new(1)
        tlist.append(2)
        tlist.append(3)
        expect(tlist.contains?(6)).to eq(false)
      end
    end
  end

  describe '.to_s' do
    context 'Given a list with nodes containing 1, 2, 3' do
      it 'should return (1) -> (2) -> (3) -> nil ' do
        tlist = LinkedList.new(1)
        tlist.append(2)
        tlist.append(3)
        expect(tlist.to_s).to eq('(1) -> (2) -> (3) -> nil')
      end
    end
  end

  describe '.insert_at' do
    context 'Given a list with nodes containing 1, 2, 3, 4, 5' do
      it 'should insert between 2 et 3 when asked to insert at 3 ' do
        tlist = LinkedList.new(1)
        tlist.append(2)
        tlist.append(3)
        tlist.append(4)
        tlist.append(5)
        tlist.insert_at(3, 9)
        expect(tlist.at(3).value).to eq(9)
        expect(tlist.at(2).next).to be(tlist.at(3))
        expect(tlist.at(3).next).to be(tlist.at(4))
      end
    end
  end

  describe '.remove_at' do
    context 'Given a list with nodes containing 1, 2, 3, 4, 5' do
      it 'should remove the third value when asked to do ' do
        tlist = LinkedList.new(1)
        tlist.append(2)
        tlist.append(3)
        tlist.append(4)
        tlist.append(5)
        tlist.remove_at(3)
        expect(tlist.at(3).value).to eq(4)
        expect(tlist.at(2).next).to be(tlist.at(3))
      end
    end
  end
end
