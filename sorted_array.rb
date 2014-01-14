class SortedArray 
  attr_accessor :internal_arr # This is for convenience in the tests.

  def initialize(input_arr=[])
    @internal_arr = []
   
    # take the input_arr and pass each value to add   
    input_arr.each{|new_ele| add(new_ele)}

  end

  def add(new_ele)

    # Hint: Use the Array#insert method.
    # take the result of first_larger_index and insert it in the appropriate position
    @internal_arr.insert(first_larger_index(new_ele), new_ele)
    
  end

  def size
    @internal_arr.length
  end

  def [](index)
    
    # previous code  didn't work
    # if index < @internal_arr.length
    #   @internal_arr.fetch(index)
    # else index >= @internal_arr.length
    #   nil
    # end

    return @internal_arr[index]

  end


  def first_larger_index(target, start_ind=0, end_ind=@internal_arr.size)
    # very similar to method_sort carrot exercise

    # assigns/reassigns the mid_ind value every recursive
    mid_ind = (end_ind + start_ind)/2

    if @internal_arr.size == 0 # terminal conditions
      return 0
    elsif target > @internal_arr[-1]
      return internal_arr.size
    elsif start_ind >= end_ind
      return end_ind
    else 
      if target == @internal_arr[mid_ind] 
        return mid_ind
      elsif target > @internal_arr[mid_ind] # if greater than, recursive with the latter half
        return first_larger_index(target, mid_ind + 1, end_ind)
      else target < @internal_arr[mid_ind] # if less than, recursive with the first half
        return first_larger_index(target, start_ind, mid_ind)
      end 
    end

  end


    # stu's code
    # @internal_arr.includ?(target) ? first_larger_index(target) : nil

    def index(target, start_ind=0, end_ind=@internal_arr.size)
  
     mid_ind = (end_ind + start_ind)/2
 
     if start_ind >= end_ind
       return nil
     else 
       if target == @internal_arr[mid_ind] 
         return mid_ind
       elsif target > @internal_arr[mid_ind]
         return index(target, mid_ind+1, end_ind)
       else 
         return index(target, start_ind=0, mid_ind)
 
       end 
     end
    end



end


