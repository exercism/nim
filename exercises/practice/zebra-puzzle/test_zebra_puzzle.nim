import std/unittest
import zebra_puzzle

suite "Zebra Puzzle":
  test "resident who drinks water":
    check waterDrunkBy() == Nationality.Norwegian

  test "resident who owns zebra":
    check zebraOwnedBy() == Nationality.Japanese
