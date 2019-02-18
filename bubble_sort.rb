def bubble_sort(ar)
  return ar if ar.size < 2 
  sorted = false 
  until_index = ar.size - 2
  
  until sorted
    sorted = true 
    0.upto(until_index) do |i|
      current, _next = ar[i], ar[i + 1]
      if current > _next 
        ar[i], ar[i + 1] = _next, current 
      end 
      sorted = false 
    end
    until_index -=1 
  end 
  ar
end