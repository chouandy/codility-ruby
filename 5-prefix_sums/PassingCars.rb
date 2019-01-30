# https://app.codility.com/programmers/lessons/5-prefix_sums/passing_cars/

def passing_cars(a)
  # Get prefix sums
	sums = passing_cars_prefix_sums(a)

	# New variables
  count = 0
  n = a.size

  a.each_with_index do |element, i|
		# Count passing if element = 0
    count += passing_cars_count_total(sums, i, n - 1) if element == 0
  end

	# Return -1 if pairs of passing cars exceeds 1,000,000,000
  count > 1000000000 ? -1 : count
end

def passing_cars_prefix_sums(a)
  n = a.size
  sums = Array.new(n + 1, 0)
  for i in 1..n
    sums[i] = sums[i - 1] + a[i - 1]
  end
  sums
end

def passing_cars_count_total(sums, x, y)
  sums[y + 1] - sums[x]
end

require 'minitest/autorun'

class PassingCarsTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 5, passing_cars([0, 1, 0, 1, 1])
  end
end
