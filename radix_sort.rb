def radix_sort(ar)
  return ar if ar.size < 2
  max = ar.minmax.map(&:abs).max
  1.upto(max.digits.size) do |i|
    hash = {}
    -9.upto(9) { |n| hash[n] = [] }
    
    base = 10 ** (i - 1)
    ar.each do |item|
      if item >=0
        hash[(item / base) % 10] << item
      else 
        hash[((item.abs / base) % 10) * - 1] << item
      end 
    end
    start_index = 0
    hash.each_value do |val|
      next if val.empty? 
      ar[start_index,val.size] = val
      start_index += val.size
    end 
  end 
  ar
end 