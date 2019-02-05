# https://app.codility.com/programmers/lessons/5-prefix_sums/genomic_range_query/

def genomic_range_query(s, p, q)
  # Get prefix sums
	sums_a, sums_c, sums_g = genomic_range_query_prefix_sums(s)

  # New variables
  result = Array.new(p.size, 0)

  p.each_with_index do |_, i|
    if genomic_range_query_count_total(sums_a, p[i], q[i]) > 0
			result[i] = 1
		elsif genomic_range_query_count_total(sums_c, p[i], q[i]) > 0
			result[i] = 2
		elsif genomic_range_query_count_total(sums_g, p[i], q[i]) > 0
			result[i] = 3
		else
			result[i] = 4
    end
  end

	result
end

def genomic_range_query_prefix_sums(s)
  # Get s length
  n = s.size

  # New A, C, G prefix sums
  sums_a = Array.new(n + 1, 0)
  sums_c = Array.new(n + 1, 0)
  sums_g = Array.new(n + 1, 0)

	# Get A, C, G prefix sums of the number of occurences of each letter from S
  for i in 1..n
    sums_a[i] = sums_a[i - 1]
    sums_c[i] = sums_c[i - 1]
    sums_g[i] = sums_g[i - 1]

    letter = s[i - 1]
    if letter == 'A'
      sums_a[i] += 1
    elsif letter == 'C'
      sums_c[i] += 1
    elsif letter == 'G'
      sums_g[i] += 1
    end
  end

  [sums_a, sums_c, sums_g]
end

def genomic_range_query_count_total(sums, x, y)
  sums[y + 1] - sums[x]
end

require 'minitest/autorun'

class GenomicRangeQueryTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal [2, 4, 1], genomic_range_query('CAGCCTA', [2, 5, 0], [4, 5, 6])
  end
end
