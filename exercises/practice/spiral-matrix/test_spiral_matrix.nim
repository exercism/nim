import
  std / unittest

import
  spiral_matrix

suite "spiral-matrix tests":
  test "empty spiral":
    check spiralMatrix(0) == newSeq[int]()
  test "trivial spiral":
    check spiralMatrix(1) == @[@[1]]
  test "spiral of size 2":
    check spiralMatrix(2) == @[@[1, 2], @[4, 3]]
  test "spiral of size 3":
    check spiralMatrix(3) == @[@[1, 2, 3], @[8, 9, 4], @[7, 6, 5]]
  test "spiral of size 4":
    check spiralMatrix(4) ==
        @[@[1, 2, 3, 4], @[12, 13, 14, 5], @[11, 16, 15, 6], @[10, 9, 8, 7]]
  test "spiral of size 5":
    check spiralMatrix(5) ==
        @[@[1, 2, 3, 4, 5], @[16, 17, 18, 19, 6], @[15, 24, 25, 20, 7],
          @[14, 23, 22, 21, 8], @[13, 12, 11, 10, 9]]
