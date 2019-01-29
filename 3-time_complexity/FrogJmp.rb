# https://app.codility.com/programmers/lessons/3-time_complexity/frog_jmp/

def frog_jmp1(x, y, d)
  # Get the distance between x and y
	distance = y - x

	# Get the jumps with d
	jumps = distance / d

  # 1. Return jumps if the remainder of distance divided by d is 0
  # 2. Return jumps + 1 if the remainder of distance divided by d is not 0
	distance % d == 0 ? jumps : jumps + 1
end

def frog_jmp2(x, y, d)
	((y - x).to_f / d).ceil
end

require 'minitest/autorun'

class FrogJmp1Tests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 3, frog_jmp1(10, 85, 30)
  end
end

class FrogJmp2Tests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 3, frog_jmp2(10, 85, 30)
  end
end
