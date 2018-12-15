def insertion_sort(ar)
  1.upto(ar.size - 1) do |i|
    current = ar[i]
    insert_pos = nil 
  
    if current < ar[i - 1]
      insert_pos = i - 1 
      insert_pos.downto(0) do |j|
        if current < ar[j]
          insert_pos = j
        else 
          insert_pos = j + 1
          break 
        end 
      end
      
      if insert_pos
        ar.insert(insert_pos, ar.delete_at(i))
      end  
    else 
      next 
    end 
  end 
  ar 
end 