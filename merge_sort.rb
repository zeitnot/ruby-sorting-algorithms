def merge(left, right)
  ar = []
  while left.any? || right.any?
    if left.any? && right.none? 
      ar << left.shift
    elsif left.none? && right.any? 
      ar << right.shift
    elsif right[0] < left[0]
      ar << right.shift 
    else 
      ar << left.shift 
    end  
  end
  ar
end

def merge_sort(ar)
  return ar if ar.size < 2 
  div = ar.size / 2 
  part1 = merge_sort(ar[0..(div -1)])
  part2 = merge_sort(ar[div..-1])
  merge(part1, part2)
end