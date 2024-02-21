module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0...self.length do
      yield self[i], i
    end
    return self
  end

  def my_select
    selected = []
    self.my_each do |item|
      a = yield item
      if a == true
        selected.push(item)
      end
    end
    return selected
  end

  def my_all?
    selected = []
    self.my_each do |item|
      a = yield item
      if a == true
        selected.push(item)
      end
    end
    if selected == self
      return true
    else
      return false
    end
  end

  def my_any?
    self.my_each do |item|
      a = yield item
      if a == true
        return true
      end
    end
    return false
  end

  def my_none?
    self.my_each do |item|
      a = yield item
      if a == true
        return false
      end
    end
    return true
  end

  def my_count
    counter = 0
    if block_given?
      self.my_each do |item|
        a = yield item
        if a == true
          counter += 1
        end
      end
      return counter
    else
      counter = self.length
      return counter
    end
  end

  def my_map
    for i in 0...self.length do
      self[i] = yield self[i]
    end
    return self
  end

  def my_inject(initial_value)
    memo = initial_value
    for i in 0...self.length do
      memo = yield memo, self[i]
    end
    return memo
  end
end


# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0...self.length do
      yield self[i]
    end
    return self
  end

end
