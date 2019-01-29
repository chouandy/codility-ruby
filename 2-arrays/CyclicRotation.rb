# https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/

def cyclic_rotation(a, k)
  # Get a length
  lenA = a.size

  # Return a if
  # 1. k is 0
  # 2. a length is 0
  # 3. a length is 1
  # 4. k is a length
  return a if k == 0 || lenA == 0 || lenA == 1

  # Update k with the remainder of the division
  k = k % lenA if k >= lenA

  # Return a if k is 0
  return a if k == 0

  # Move the right part to front, and append the left part
  a[(lenA - k)..(lenA - 1)] + a[0..(lenA - k - 1)]
end

require 'minitest/autorun'

class CyclicRotationTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal [9, 7, 6, 3, 8], cyclic_rotation([3, 8, 9, 7, 6], 3)
  end

  def test_example2
    assert_equal [0, 0, 0], cyclic_rotation([0, 0, 0], 1)
  end

  def test_example3
    assert_equal [1, 2, 3, 4], cyclic_rotation([1, 2, 3, 4], 4)
  end

  def test_example4
    assert_equal [], cyclic_rotation([], 0)
  end
end
