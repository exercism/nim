import std/unittest
import binary_search

suite "Binary Search":
  test "finds a value in an array with one element":
    check binarySearch([6], 6) == 0

  test "finds a value in the middle of an array":
    check binarySearch([1, 3, 4, 6, 8, 9, 11], 6) == 3

  test "finds a value at the beginning of an array":
    check binarySearch([1, 3, 4, 6, 8, 9, 11], 1) == 0

  test "finds a value at the end of an array":
    check binarySearch([1, 3, 4, 6, 8, 9, 11], 11) == 6

  test "finds a value in an array of odd length":
    check binarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634],
                        144) == 9

  test "finds a value in an array of even length":
    check binarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377],
                        21) == 5

  test "identifies that a value is not included in the array":
    check binarySearch([1, 3, 4, 6, 8, 9, 11], 7) == -1

  test "a value smaller than the array's smallest value is not found":
    check binarySearch([1, 3, 4, 6, 8, 9, 11], 0) == -1

  test "a value larger than the array's largest value is not found":
    check binarySearch([1, 3, 4, 6, 8, 9, 11], 13) == -1

  test "nothing is found in an empty array":
    const a: array[0, int] = []
    check binarySearch(a, 1) == -1

  test "nothing is found when the left and right bounds cross":
    check binarySearch([1, 2], 0) == -1
