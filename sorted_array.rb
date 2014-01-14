class SortedArray
  attr_accessor :internal_arr # This is for convenience in the tests.

  def initialize(input_arr=[])
    @internal_arr = input_arr
    # Fill in the rest of the initialize method here.
    # What should you do with each element of the incoming array?

    self.first_larger_index(@internal_arr[0], start_ind=1, end_ind=@internal_arr.size)
    #hmm... is this the right way?

  end

  def add(new_ele)

    # Hint: Use the Array#insert method.
    @internal_arr.insert(
    first_larger_index(new_ele, start_ind=0, end_ind=@internal_arr.size), new_ele)
    
  end

  def size
    @internal_arr.size
  end

  def [](index)

    #if index is a range then use index.to_a to convert to an array.
    #but how do I check if index is a range rather than a single value?
    #also can use index.first and index.last

    if index < @internal_arr.length
      @internal_arr.fetch(index)
    else index >= @internal_arr.length
      nil
    end

  end


  def first_larger_index(target, start_ind=0, end_ind=@internal_arr.size)
    
    mid_ind = (end_ind + start_ind)/2

    if @internal_arr.size == 0
      return internal_arr.size
    elsif target > @internal_arr[-1]
      return internal_arr.size
    elsif start_ind >= end_ind
      return end_ind
    else 
      if target == @internal_arr[mid_ind] 
        return mid_ind
      elsif target > @internal_arr[mid_ind]
        return first_larger_index(target, mid_ind+1, end_ind)
      else target < @internal_arr[mid_ind]
        return first_larger_index(target, start_ind, mid_ind)
      end 
    end

  end

  def index(target)
    
      find_match(target, start_ind=0, end_ind=@internal_arr.size)

  end

  def find_match(target, start_ind=0, end_ind=@internal_arr.size)

    mid_ind = (end_ind + start_ind)/2

    if not @internal_arr.include?(target)
      nil
    else 
      if target == @internal_arr[mid_ind] 
        return mid_ind
      elsif @internal_arr[0...mid_ind].include?(target)
        return find_match(target, start_ind=0, mid_ind)
      else @internal_arr[mid_ind+1...end_ind].include?(target)
        return find_match(target, mid_ind+1, end_ind)

      end 
    end
  end


end
