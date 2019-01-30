# https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/

def odd_occurrences_in_array(a)
  # Group by element
  histogram = a.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
  # Find unpaired element
  histogram.each { |k, v| return k if v % 2 == 1 }
end

require 'minitest/autorun'

class OddOccurrencesInArrayTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 7, odd_occurrences_in_array([9,3,9,3,9,7,9])
  end
end
