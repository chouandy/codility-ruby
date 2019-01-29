# https://app.codility.com/programmers/lessons/4-counting_elements/perm_check/

def perm_check(a)
  # New variables
  seen = {}

  # Sum a
  sum_a = 0
  a.each do |element|
    # Check duplicate element
    return 0 if seen[element]
    # Set seen
    seen[element] = true
    # Add sum A and element up
    sum_a += element
  end

  # Get A length
  len_a = a.size

  # Check sum A
  (1 + len_a) * len_a / 2 == sum_a ? 1 : 0
end

require 'minitest/autorun'

class PermCheckTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 1, perm_check([4, 1, 3, 2])
  end

  def test_example2
    assert_equal 0, perm_check([4, 1, 3])
  end

  def test_example3
    assert_equal 0, perm_check([9, 5, 7, 3, 2, 7, 3, 1, 10, 8])
  end
end
