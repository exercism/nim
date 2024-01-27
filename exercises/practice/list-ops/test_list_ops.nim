import unittest
import list_ops


suite "append entries to a list and return the new list":
  test "empty lists":
    check append(@[], @[]).len == 0

  test "list to empty list":
    check append(@[], @[1, 2, 3, 4]) == @[1, 2, 3, 4]

  test "empty list to list":
    check append(@[1, 2, 3, 4], @[]) == @[1, 2, 3, 4]

  test "non-empty lists":
    check append(@[1, 2], @[2, 3, 4, 5]) == @[1, 2, 2, 3, 4, 5]


suite "concatenate a list of lists":
  test "empty list":
    check concatenate(@[]).len == 0

  test "list of lists":
    check concatenate(@[@[1, 2], @[3], @[], @[4, 5, 6]]) == @[1, 2, 3, 4, 5, 6]


suite "filter list returning only values that satisfy the filter function":
  func predicate(x: int): bool = x mod 2 == 1

  test "empty list":
    check filter(@[], predicate).len == 0

  test "non-empty list":
    check filter(@[1, 2, 3, 5], predicate) == @[1, 3, 5]


suite "returns the length of a list":
  test "empty list":
    check length(@[]) == 0

  test "non-empty list":
    check length(@[1, 2, 3, 4]) == 4


suite "return a list of elements whose values equal the list value transformed by the mapping function":
  func function(x: int): int = x + 1

  test "empty list":
    check map(@[], function).len == 0

  test "non-empty list":
    check map(@[1, 3, 5, 7], function) == @[2, 4, 6, 8]


suite "folds (reduces) the given list from the left with a function":
  test "empty list":
    func function(x: int, y: int): int = x + y
    check foldl(@[], function, 2) == 2

  test "direction independent function applied to non-empty list":
    func function(x: int, y: int): int = x + y
    check foldl(@[1, 2, 3, 4], function, 5) == 15

  test "direction dependent function applied to non-empty list":
    func function(x: int, y: int): int | float = x - y
    check foldl(@[1, 2, 3, 4], function, 24) == 14

  test "empty list":
    func function(x: int, y: int): int = y + x
    check foldl(@[], function, 2) == 2

  test "direction independent function applied to non-empty list":
    func function(x: int, y: int): int = y + x
    check foldl(@[1, 2, 3, 4], function, 5) == 15

  test "direction dependent function applied to non-empty list":
    func function(x: int, y: int): int = y - x
    check foldl(@[1, 2, 3, 4], function, 5) == 7


suite "folds (reduces) the given list from the right with a function":
  test "empty list":
    func function(x: int, y: int): int = x + y
    check foldr(@[], function, 2) == 2

  test "direction independent function applied to non-empty list":
    func function(x: int, y: int): int = x + y
    check foldr(@[1, 2, 3, 4], function, 5) == 15

  test "direction dependent function applied to non-empty list":
    func function(x: int, y: int): int | float = x - y
    check foldr(@[1, 2, 3, 4], function, 24) == 14

  test "empty list":
    func function(x: int, y: int): int = y + x
    check foldr(@[], function, 2) == 2

  test "direction independent function applied to non-empty list":
    func function(x: int, y: int): int = y + x
    check foldr(@[1, 2, 3, 4], function, 5) == 15

  test "direction dependent function applied to non-empty list":
    func function(x: int, y: int): int = y - x
    check foldr(@[1, 2, 3, 4], function, 5) == 3


suite "reverse the elements of the list":
  test "empty list":
    check reverse(@[]).len == 0

  test "non-empty list":
    check reverse(@[1, 2, 3, 4]) == @[4, 3, 2, 1]
