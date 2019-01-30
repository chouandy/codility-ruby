# https://app.codility.com/programmers/lessons/4-counting_elements/missing_integer/

def missing_integer(a)
  # New variables
  seen = {}
  max = 0

  a.each do |element|
    # Check duplicate element
    next if seen[element]
    # Set seen
    seen[element] = true
    # Update max
    max = element if max < element
  end

	# Find missing integer with max + 1
  for i in 1..(max + 1)
    return i unless seen[i]
  end

  1
end

require 'minitest/autorun'

class MissingIntegerTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 5, missing_integer([1, 3, 6, 4, 1, 2])
  end

  def test_example2
    assert_equal 4, missing_integer([1, 2, 3])
  end

  def test_example3
    assert_equal 1, missing_integer([-1, -3])
  end
end
