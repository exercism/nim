import
  std / unittest

import
  sublist

suite "sublist tests":
  test "empty lists":
    check sublist(newSeq[int](), newSeq[int]()) == "equal"
  test "empty list within non empty list":
    check sublist(newSeq[int](), @[1, 2, 3]) == "sublist"
  test "non empty list contains empty list":
    check sublist(@[1, 2, 3], newSeq[int]()) == "superlist"
  test "list equals itself":
    check sublist(@[1, 2, 3], @[1, 2, 3]) == "equal"
  test "different lists":
    check sublist(@[1, 2, 3], @[2, 3, 4]) == "unequal"
  test "false start":
    check sublist(@[1, 2, 5], @[0, 1, 2, 3, 1, 2, 5, 6]) == "sublist"
  test "consecutive":
    check sublist(@[1, 1, 2], @[0, 1, 1, 1, 2, 1, 2]) == "sublist"
  test "sublist at start":
    check sublist(@[0, 1, 2], @[0, 1, 2, 3, 4, 5]) == "sublist"
  test "sublist in middle":
    check sublist(@[2, 3, 4], @[0, 1, 2, 3, 4, 5]) == "sublist"
  test "sublist at end":
    check sublist(@[3, 4, 5], @[0, 1, 2, 3, 4, 5]) == "sublist"
  test "at start of superlist":
    check sublist(@[0, 1, 2, 3, 4, 5], @[0, 1, 2]) == "superlist"
  test "in middle of superlist":
    check sublist(@[0, 1, 2, 3, 4, 5], @[2, 3]) == "superlist"
  test "at end of superlist":
    check sublist(@[0, 1, 2, 3, 4, 5], @[3, 4, 5]) == "superlist"
  test "first list missing element from second list":
    check sublist(@[1, 3], @[1, 2, 3]) == "unequal"
  test "second list missing element from first list":
    check sublist(@[1, 2, 3], @[1, 3]) == "unequal"
  test "first list missing additional digits from second list":
    check sublist(@[1, 2], @[1, 22]) == "unequal"
  test "order matters to a list":
    check sublist(@[1, 2, 3], @[3, 2, 1]) == "unequal"
  test "same digits but different numbers":
    check sublist(@[1, 0, 1], @[10, 1]) == "unequal"
