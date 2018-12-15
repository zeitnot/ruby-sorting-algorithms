require 'test/unit'
require_relative '../shell_sort'
require_relative '../bubble_sort'
require_relative '../selection_sort'
require 'bigdecimal'

class TestShellSort < Test::Unit::TestCase

  def setup
    @algo = [:shell_sort, :bubble_sort, :selection_sort]
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