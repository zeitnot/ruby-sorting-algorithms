require 'pry'
require 'benchmark/ips'
require_relative 'insertion_sort'
require_relative 'selection_sort'
require_relative 'bubble_sort'
require_relative 'shell_sort'
require_relative 'quick_sort'
require_relative 'merge_sort'
require_relative 'radix_sort'

list = {
  sorted_100: -50..50,
  sorted_500: -250..250,
  sorted_1000: -500..500,
  sorted_5000: -2500..2500,
  sorted_10000: -5_000..5_000,
  
  reverse_sorted_100: -50..50,
  reverse_sorted_500: -250..250,
  reverse_sorted_1000: -500..500,
  reverse_sorted_5000: -2500..2500,
  reverse_sorted_10000: -5_000..5_000,
  
  shuffled_100: -50..50,
  shuffled_500: -250..250,
  shuffled_1000: -500..500,
  shuffled_5000: -2500..2500,
  shuffled_10000: -5_000..5_000
}

l = 0
list.each do |key,val|
  next if l > 2
  l += 1
  Benchmark.ips do |bm|
    puts "\t\t"+('#' * 10) + " #{key} " + ('#' * 10) 
    case key
    when /reverse/
      ar = Array(val).reverse
    when /shuffled/
      ar = Array(val).shuffle
    else
      ar = Array(val)
    end
   
    bm.report('Insertion Sort') do
      insertion_sort(ar.dup) 
    end

    bm.report('Selection Sort') do 
      selection_sort(ar.dup) 
    end  

    bm.report('Shell Sort') do 
      shell_sort(ar.dup) 
    end

    bm.report('Quick Sort') do 
      quick_sort(ar.dup) 
    end 


    bm.report('Merge Sort') do 
      merge_sort(ar.dup) 
    end 


    bm.report('Radix Sort') do 
      radix_sort(ar.dup) 
    end 

    bm.report('Bubble Sort') do 
      bubble_sort(ar.dup) 
    end
    bm.compare!
  end 
end 
