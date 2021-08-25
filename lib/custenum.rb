module Enumerable
  def my_each
    if block_given? 
      for i in 0..self.length 
        yield self[i]
      end 
    end
  end 

  def my_each_with_index
    if block_given?
      for i in 0..self.length-1
        yield self[i], i
      end 
    end 
  end

  def my_select
    ret = []
    if block_given?
      for i in 0..self.length-1
        if yield self[i] 
          ret.push(self[i])
        end 
      end 
      return ret
    end 
  end 

  def my_all?
    if block_given?
      for i in 0..self.length-1 
        if (yield self[i]) == false 
          return false
        end 
      end 

      return true
    else
      return false
    end 
  end 

  def my_any?
    if block_given?
      for i in 0..self.length-1 
        if yield self[i]
          return true 
        end 
      end 

      return false 
    else
      return false
    end 
  end 

  def my_map
    ret = []
    if block_given?
      for i in 0..self.length-1 
        ret.push(yield self[i])
      end 
      return ret
    else
      return self
    end 
  end 

end 

puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each  { |item| puts item }
numbers.each  { |item| puts item }
numbers.each_with_index{|item, index| puts "#{item} : #{index}" }
numbers.my_each_with_index{|item, index| puts "#{item} : #{index}" }
puts numbers.my_select{ |el| el < 4 } 
puts numbers.my_all?{|el| el.is_a?(Integer)}
puts numbers.my_any?{|el| el.is_a?(Integer)}
puts numbers.my_map{|el| el * 5}
