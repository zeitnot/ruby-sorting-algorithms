def merge(left, right)
  return right if left.none? 
  return left  if right.none? 
  
  if right[0] < left[0]
    [right[0]] + merge(left, right[1..-1])
  else 
    [left[0]] + merge(left[1..-1], right)
  end  
end

def merge_sort(ar)
  return ar if ar.size < 2 
  div = ar.size / 2 
  part1 = merge_sort(ar[0..(div -1)])
  part2 = merge_sort(ar[div..-1])
  merge(part1, part2)
end