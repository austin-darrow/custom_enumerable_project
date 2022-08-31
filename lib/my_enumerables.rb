module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    for element in self
      yield element, index
      index += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    selected = []
    my_each { |el| selected << el if yield el }
    selected
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    my_each { |e| return false unless yield e }
    true
  end

  def my_any?
    my_each { |e| return true if yield e }
    false
  end

  def my_none?
    my_each { |e| return false if yield e }
    true
  end

  def my_count
    count = 0
    if block_given?
      my_each { |e| count += 1 if yield e }
    else
      count = self.length
    end
    count
  end

  def my_map
    new_arr = []
    my_each { |e| new_arr.push(yield(e)) }
    new_arr
  end

  def my_inject(arg=nil)
    result = arg
    my_each { |e| result = yield result, e }
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self
      yield element
    end
    self
  end
end
