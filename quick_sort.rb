def partition(ar, start, _end)
  pivot = _end
  end_pos = pivot - 1
  i = start - 1
  start.upto(end_pos) do |k|
    if ar[k] < ar[pivot]
      i +=1
      next if k == i
      ar[i], ar[k] = ar[k], ar[i] 
    end  
  end 
  ar[pivot], ar[i+1] = ar[i+1], ar[pivot]
  i + 1
end 

def quick_sort(ar,start = nil, _end = nil)
  start = 0 unless start
  _end = ar.size - 1 unless _end 
  if start < _end
    pivot = partition(ar,start, _end)
    quick_sort(ar,start, pivot - 1)
    quick_sort(ar, pivot + 1, _end) 
  end  
  ar
end 