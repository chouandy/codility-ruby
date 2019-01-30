# https://app.codility.com/programmers/lessons/4-counting_elements/frog_river_one/

def frog_river_one1(x, a)
  # New variables
  seen = {}
  count = 0

  a.each_with_index do |element, i|
    # Check duplicate element
    next if seen[element]
    # Set seen
    seen[element] = true
    # Increase count
    count += 1
    # Check count and x
    return i if count == x
  end

  -1
end

def frog_river_one2(x, a)
  # New variables
  seen = {}
  sum_a = 0
  second = -1

  # Sum x
	sum_x = x * (x + 1) / 2

  a.each_with_index do |element, i|
    # Check duplicate element
    next if seen[element]
    # Set seen
    seen[element] = true
    # Add sum a and element up
		sum_a += element
    # Check sum A and sum X
    return i if sum_a == sum_x
  end

  -1
end

require 'minitest/autorun'

class FrogRiverOne1Tests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 6, frog_river_one1(5, [1, 3, 1, 4, 2, 3, 5, 4])
  end
end

class FrogRiverOne2Tests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 6, frog_river_one2(5, [1, 3, 1, 4, 2, 3, 5, 4])
  end
end
