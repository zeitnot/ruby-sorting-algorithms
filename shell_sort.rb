def shell_sort(ar)
  gap = ar.size / 2
  while 0 < gap
    0.upto((ar.size - 1) - gap ) do |i|
		  elem = ar[i + gap]
      j = i  
      while -1 < j && elem < ar[j]
        ar[j],ar[j + gap] = elem , ar[j]
        j -=gap
      end 
    end 		
    gap /=2 
  end   
  ar
end 