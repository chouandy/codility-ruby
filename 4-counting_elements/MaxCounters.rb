# https://app.codility.com/programmers/lessons/4-counting_elements/max_counters/

def max_counters(n, a)
  # New variables
  counters = Array.new(n, 0)
  max_num = n + 1
  base = 0
  current_max = 0

  a.each do |element|
    # Check element is max number or not
    if element == max_num
      base = current_max
    else
      # Get counter index
      index = element - 1
      # Update counter to base if counter number < base
      counters[index] = base if counters[index] < base
      # Increase counter
      counters[index] += 1
      # Update current max number
      current_max = counters[index] if current_max < counters[index]
    end
  end

  # Update counters to base, if counter number < base number
  counters.each_with_index do |v, i|
    counters[i] = base if v < base
  end

  counters
end

require 'minitest/autorun'

class PermCheckTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal [3, 2, 2, 4, 2], max_counters(5, [3, 4, 4, 6, 1, 4, 4])
  end
end
