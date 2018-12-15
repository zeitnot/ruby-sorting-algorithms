def selection_sort(ar)
  return ar if ar.size < 2 
  0.upto(ar.size - 1 ) do |i|
    min = ar[i]
    min_pos = 0 
    (i + 1).upto(ar.size - 1 ) do |j|
      if min > ar[j]
        min,min_pos = ar[j], j 
      end 
    end
    unless min_pos == 0 
      ar[i], ar[min_pos] = ar[min_pos], ar[i]
    end    
  end 
  ar 
end 