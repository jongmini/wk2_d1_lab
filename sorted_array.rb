class SortedArray
  attr_accessor :internal_arr # This is for convenience in the tests.

  def initialize(input_arr=[])
    @internal_arr = input_arr
    # Fill in the rest of the initialize method here.
    # What should you do with each element of the incoming array?
  end

  def add(new_ele)

    @internal_arr.insert(-1,@new_ele)
    # Hint: Use the Array#insert method.
  end

  def size
    @internal_arr.size
  end

  def [](index)

    if index < @internal_arr.length
      @internal_arr.fetch(index)
    else index >= @internal_arr.length
      nil
    end

  end


  def first_larger_index(target, start_ind=0, end_ind=@internal_arr.size)

    if @internal_arr.size == 0
      return internal_arr.size
    elsif start_ind >= end_ind
      return end_ind
    else 
      mid_ind = (end_ind + start_ind)/2 
      if target > @internal_arr[mid_ind]
        return first_larger_index(target, mid_ind+1, end_ind)
      else target < @internal_arr[mid_ind]
        return first_larger_index(target, start_ind, mid_ind)
      end 
    end

  end

  def index(target)
    raise NotImplementedError.new("You need to implement the index method!")
  end
end
