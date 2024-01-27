import unittest
import list_ops


suite "append entries to a list and return the new list":
  test "empty lists":  # 485b9452-bf94-40f7-a3db-c3cf4850066a
    check append(@[], @[]).len == 0

  test "list to empty list":  # 2c894696-b609-4569-b149-8672134d340a
    check append(@[], @[1, 2, 3, 4]) == @[1, 2, 3, 4]

  test "empty list to list":  # e842efed-3bf6-4295-b371-4d67a4fdf19c
    check append(@[1, 2, 3, 4], @[]) == @[1, 2, 3, 4]

  test "non-empty lists":  # 71dcf5eb-73ae-4a0e-b744-a52ee387922f
    check append(@[1, 2], @[2, 3, 4, 5]) == @[1, 2, 2, 3, 4, 5]


suite "concatenate a list of lists":
  test "empty list":  # 28444355-201b-4af2-a2f6-5550227bde21
    check concatenate(@[]).len == 0

  test "list of lists":  # 331451c1-9573-42a1-9869-2d06e3b389a9
    check concatenate(@[@[1, 2], @[3], @[], @[4, 5, 6]]) == @[1, 2, 3, 4, 5, 6]

  # test "list of nested lists":  # d6ecd72c-197f-40c3-89a4-aa1f45827e09
  #   check concatenate(@[@[@[1], @[2]], @[@[3]], @[@[]], @[@[4, 5, 6]]]) == @[@[1], @[2], @[3], @[], @[4, 5, 6]]


suite "filter list returning only values that satisfy the filter function":
  func predicate(x: int): bool = x mod 2 == 1

  test "empty list":  # 0524fba8-3e0f-4531-ad2b-f7a43da86a16
    check filter(@[], predicate).len == 0

  test "non-empty list":  # 88494bd5-f520-4edb-8631-88e415b62d24
    check filter(@[1, 2, 3, 5], predicate) == @[1, 3, 5]


suite "returns the length of a list":
  test "empty list":  # 1cf0b92d-8d96-41d5-9c21-7b3c37cb6aad
    check length(@[]) == 0

  test "non-empty list":  # d7b8d2d9-2d16-44c4-9a19-6e5f237cb71e
    check length(@[1, 2, 3, 4]) == 4


suite "return a list of elements whose values equal the list value transformed by the mapping function":
  func function(x: int): int = x + 1

  test "empty list":  # c0bc8962-30e2-4bec-9ae4-668b8ecd75aa
    check map(@[], function).len == 0

  test "non-empty list":  # 11e71a95-e78b-4909-b8e4-60cdcaec0e91
    check map(@[1, 3, 5, 7], function) == @[2, 4, 6, 8]


suite "folds (reduces) the given list from the left with a function":
  test "empty list":  # 613b20b7-1873-4070-a3a6-70ae5f50d7cc
    func function(x: int, y: int): int = x + y
    check foldl(@[], function, 2) == 2

  test "direction independent function applied to non-empty list":  # e56df3eb-9405-416a-b13a-aabb4c3b5194
    func function(x: int, y: int): int = x + y
    check foldl(@[1, 2, 3, 4], function, 5) == 15

  test "direction dependent function applied to non-empty list":  # d2cf5644-aee1-4dfc-9b88-06896676fe27
    func function(x: int, y: int): int | float = x - y
    check foldl(@[1, 2, 3, 4], function, 24) == 14

  test "empty list":  # 36549237-f765-4a4c-bfd9-5d3a8f7b07d2
    func function(x: int, y: int): int = y + x
    check foldl(@[], function, 2) == 2

  test "direction independent function applied to non-empty list":  # 7a626a3c-03ec-42bc-9840-53f280e13067
    func function(x: int, y: int): int = y + x
    check foldl(@[1, 2, 3, 4], function, 5) == 15

  test "direction dependent function applied to non-empty list":  # d7fcad99-e88e-40e1-a539-4c519681f390
    func function(x: int, y: int): int = y - x
    check foldl(@[1, 2, 3, 4], function, 5) == 7


suite "folds (reduces) the given list from the right with a function":
  test "empty list":  # aeb576b9-118e-4a57-a451-db49fac20fdc
    func function(x: int, y: int): int = x + y
    check foldr(@[], function, 2) == 2

  test "direction independent function applied to non-empty list":  # c4b64e58-313e-4c47-9c68-7764964efb8e
    func function(x: int, y: int): int = x + y
    check foldr(@[1, 2, 3, 4], function, 5) == 15

  test "direction dependent function applied to non-empty list":  # be396a53-c074-4db3-8dd6-f7ed003cce7c
    func function(x: int, y: int): int | float = x - y
    check foldr(@[1, 2, 3, 4], function, 24) == 14

  test "empty list":  # 17214edb-20ba-42fc-bda8-000a5ab525b0
    func function(x: int, y: int): int = y + x
    check foldr(@[], function, 2) == 2

  test "direction independent function applied to non-empty list":  # e1c64db7-9253-4a3d-a7c4-5273b9e2a1bd
    func function(x: int, y: int): int = y + x
    check foldr(@[1, 2, 3, 4], function, 5) == 15

  test "direction dependent function applied to non-empty list":  # 8066003b-f2ff-437e-9103-66e6df474844
    func function(x: int, y: int): int = y - x
    check foldr(@[1, 2, 3, 4], function, 5) == 3


suite "reverse the elements of the list":
  test "empty list":  # 94231515-050e-4841-943d-d4488ab4ee30
    check reverse(@[]).len == 0

  test "non-empty list":  # fcc03d1e-42e0-4712-b689-d54ad761f360
    check reverse(@[1, 2, 3, 4]) == @[4, 3, 2, 1]

  # test "list of lists is not flattened":  # 40872990-b5b8-4cb8-9085-d91fc0d05d26
    # check reverse(@[@[], @[1], @[2, 3]]) == @[@[2, 3], @[1], @[]]
