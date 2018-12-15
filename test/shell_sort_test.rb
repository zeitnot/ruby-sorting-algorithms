require 'test/unit'
require '../shell_sort'
require 'bigdecimal'

class TestShellSort < Test::Unit::TestCase

	def test_empty_array
		assert_equal(shell_sort([]), [])
	end 

	def test_unordered_array
		array = [-1,100,0,4,5,0,0]
		assert_equal(shell_sort(array), [-1,0,0,0,4,5,100])
	end 

	def test_with_native_sort_function
		10.times do
			array = Array(0..10000).shuffle 
			assert_equal(shell_sort(array.dup), array.sort)
		end 
	end 

	def test_with_real_numbers
		array = [0,0.1,BigDecimal('1.2'), 1/2r, 1, -1]
		assert_equal(shell_sort(array), [-1,0,0.1, 1/2r, 1, BigDecimal('1.2')])
	end 
end 