# https://app.codility.com/programmers/lessons/5-prefix_sums/min_avg_two_slice/

def min_avg_two_slice(a)
  # Get a length
	n = a.size

	# New variables
	min_avg = 10000
	result = 0

  for i in 0..n-2
		# The minimal of 2 consecutive slices
    if i + 1 < n
      avg = (a[i] + a[i+1]) / 2.0
      if min_avg > avg
        min_avg = avg
				result = i
      end
    end

		# The minimal of 3 consecutive slices
    if i + 2 < n
      avg = (a[i] + a[i+1] + a[i+2]) / 3.0
      if min_avg > avg
        min_avg = avg
				result = i
      end
    end
  end

	result
end

require 'minitest/autorun'

class MinAvgTwoSliceTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 1, min_avg_two_slice([4, 2, 2, 5, 1, 5, 8])
  end
end
