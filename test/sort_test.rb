require 'test/unit'
require_relative '../shell_sort'
require_relative '../bubble_sort'
require_relative '../selection_sort'
require_relative '../insertion_sort'
require_relative '../quick_sort'
require_relative '../merge_sort'
require_relative '../radix_sort'

require 'bigdecimal'

class TestRadixSort < Test::Unit::TestCase
  
  def test_with_empty_array
    assert_equal(radix_sort([]), [])
  end 
  
  def test_with_single_element_array
    assert_equal(radix_sort([1]), [1])
  end 
  
  def test_unordered_array
    array = [-1,100,0,4,5,0,0]
    assert_equal(radix_sort(array), [-1,0,0,0,4,5,100])
  end
  

  def test_reversed_sorted_array
    array = Array(0..10).reverse
    assert_equal(radix_sort(array), [0,1,2,3,4,5,6,7,8,9, 10])
  end
  
  def test_with_native_sort_function
    10.times do
      array = Array(-10..10).shuffle
      assert_equal(radix_sort(array.dup), array.sort)
    end
  end
end 

class TestSomeSorts < Test::Unit::TestCase

  def setup
    @algo = [:shell_sort, :bubble_sort, :selection_sort, :insertion_sort, :quick_sort, :merge_sort]
  end
  
  def test_empty_array
    @algo.each do |algo|
      assert_equal(self.send(algo, []), [])
    end
  end

  def test_unordered_array
    array = [-1,100,0,4,5,0,0]
    @algo.each do |algo|
      assert_equal(self.send(algo,array), [-1,0,0,0,4,5,100])
    end
  end

  def test_reversed_sorted_array
    array = Array(0..10).reverse
    @algo.each do |algo|
      assert_equal(self.send(algo,array), [0,1,2,3,4,5,6,7,8,9, 10])
    end
  end
  
  def test_with_native_sort_function
    10.times do
      array = Array(0..1000).shuffle
      @algo.each do |algo|
        assert_equal(self.send(algo,array.dup), array.sort)
      end
    end
  end

  def test_with_real_numbers
    array = [0,0.1,BigDecimal('1.2'), 1/2r, 1, -1]
    @algo.each do |algo|
      assert_equal(self.send(algo,array), [-1,0,0.1, 1/2r, 1, BigDecimal('1.2')])
    end
  end
end 