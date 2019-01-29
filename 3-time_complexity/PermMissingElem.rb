# https://app.codility.com/programmers/lessons/3-time_complexity/perm_missing_elem/

def perm_missing_elem(a)
  # Get real array length
	len_real = a.size + 1
	# Get real array sum
	sum_real = (1 + len_real) * len_real / 2
	# Sum a
	sum_a = a.inject { |sum, x| sum + x }

	# Return real array sum minus sum a
	sum_real - sum_a
end

require 'minitest/autorun'

class PermMissingElemTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 4, perm_missing_elem([2, 3, 1, 5])
  end
end
