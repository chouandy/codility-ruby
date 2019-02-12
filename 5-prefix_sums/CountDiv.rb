# https://app.codility.com/programmers/lessons/5-prefix_sums/count_div/

def count_div(a, b, k)
  # The quotient of b/k - the quotient of a/k
	divisibles = b / k - a / k
	# Check A is divisible by K or not
  divisibles += 1 if a % k == 0

  divisibles
end

require 'minitest/autorun'

class CountDivTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 3, count_div(6, 11, 2)
  end
end
