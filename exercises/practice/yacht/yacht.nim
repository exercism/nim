type
  Category* = enum
    Ones, Twos, Threes, Fours, Fives, Sixes,
    FullHouse, FourOfAKind, LittleStraight, BigStraight, Choice, Yacht

proc score*(dice: array[5, int], category: Category): int =
  discard
