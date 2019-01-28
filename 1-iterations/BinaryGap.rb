# https://app.codility.com/programmers/lessons/1-iterations/binary_gap/

# 標準解概念如下：
# 1. 主要使用二元運算子 "右移 (>>)"。
# 2. 先宣告 "最大計算數量" 與 "目前計算數量"，均為 0。
# 3. 取得 unsigned int 轉換成二進位後，右邊連續為 0 的個數，採用的方法為
#    https://graphics.stanford.edu/~seander/bithacks.html#ZerosOnRightModLookup。
# 4. 如果有找到右邊連續為 0 的個數，使用二元運算子 "右移 (>>)"，將 N 直接往右移至非 0 的位址，再開始尋找。
# 5. 當 N 大於 0 則重複以下步驟
#   (1) N 除以 2 取餘數 (%)，如果為 1，則重置 "目前計算數量"
#   (2) N 除以 2 取餘數 (%)，如果為 0，則累加 "目前計算數量"，且如果 "目前計算數量" 大於 "最大計算數量"，
#       則將 "最大計算數量" 更新為 "目前計算數量"
#   (3) N 右移 1
# 6. 返回 "最大計算數量"

Mod37BitPosition = [
  32, 0, 1, 26, 2, 23, 27, 0, 3, 16, 24, 30, 28, 11, 0, 13, 4,
  7, 17, 0, 25, 22, 31, 15, 29, 10, 12, 6, 0, 21, 14, 9, 5,
  20, 8, 19, 18
]

def binary_gap(n)
  # New variables
  max_length = 0
  current_length = 0

  # Get trailing zeros
  trailing = Mod37BitPosition[(n & -n) % 37]

  # If trailing > 0, right shift
  n = n >> trailing if trailing > 0

  while n > 0
    if n % 2 == 1
      # Reset the counter
      current_length = 0
    else
      # Increase the counter
      current_length += 1
      # Update max length
      max_length = current_length if max_length < current_length
    end
    # N right shift 1
    n >>= 1
  end

  max_length
end

require 'minitest/autorun'

class BinaryGapTests < MiniTest::Unit::TestCase

  def test_example1
    assert_equal 5, binary_gap(1041)
  end

  def test_example2
    assert_equal 1, binary_gap(20)
  end

  def test_example3
    assert_equal 0, binary_gap(1)
  end

  def test_example4
    assert_equal 0, binary_gap(1024)
  end
end
