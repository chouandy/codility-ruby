# https://app.codility.com/programmers/lessons/3-time_complexity/tape_equilibrium/

def tape_equilibrium(a)
	# Get first sum left and sum right
	sum_left = a[0]
	sum_right = a[1..a.size].inject { |sum, x| sum + x }

	# Set min with first diff
	min = (sum_left - sum_right).abs

	# Start from 1 index element, and end with N - 1 element
	i = 1
	while i < a.size - 1
		# add sum left and element up
		sum_left += a[i]
		# Subtract element from sum right
		sum_right -= a[i]
		# Get diff
		diff = (sum_left - sum_right).abs
		# Update min if diff < min
		min = diff if diff < min

		i += 1
	end

	min
end

require 'minitest/autorun'

class TapeEquilibriumTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 1, tape_equilibrium([3, 1, 2, 4, 3])
	end

	def test_example2
    assert_equal 2000, tape_equilibrium([-1000, 1000])
  end
end
