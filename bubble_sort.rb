def bubble_sort(ar)
  1.upto(ar.size ) do |i|
    0.upto(ar.size - 1) do |j|
      if ar[j+1] && ar[j+1] < ar[j]
        ar[j], ar[j+1]  = ar[j+1], ar[j]
      end 
    end 
  end 
  ar 
end 