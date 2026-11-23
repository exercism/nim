import std/math

type Category* = enum
  Ones = 1, Twos, Threes, Fours, Fives, Sixes,
  FullHouse, FourOfAKind, LittleStraight, BigStraight, Choice, Yacht

const littleStraight = {1'i8, 2, 3, 4, 5}
const bigStraight = {2'i8, 3, 4, 5, 6}

func sumOnly(d: openArray[int], n: int): int =
  ## Returns the sum of the items in `d` that equal `n`.
  for item in d:
    if item == n:
      result += n

func toBitset(d: openArray[int]): set[int8] =
  for item in d:
    result.incl(item.int8)

func mostCommon(d: array[5, int]): tuple[item: int, count: int] =
  ## Returns the most common item in `d` and the number of times it occurs.
  ## `d.mostCommon` is equivalent to `d.toCountTable.largest`, but faster.
  var counts: array[1..6, int]
  for item in d:
    inc counts[item]

  var maxIdx = 1
  for i in 2 .. counts.high:
    if counts[i] > counts[maxIdx]:
      maxIdx = i
  result.item = maxIdx
  result.count = counts[maxIdx]

func score*(d: array[5, int], category: Category): int =
  case category
  of Ones..Sixes:
    d.sumOnly(category.ord)
  of FullHouse:
    if d.toBitset.card == 2 and d.mostCommon.count == 3: d.sum else: 0
  of FourOfAKind:
    let (item, count) = d.mostCommon
    if count >= 4: item * 4 else: 0
  of LittleStraight:
    if d.toBitset == littleStraight: 30 else: 0
  of BigStraight:
    if d.toBitset == bigStraight: 30 else: 0
  of Choice:
    d.sum
  of Yacht:
    if d[0] == d[1] and d[1] == d[2] and d[2] == d[3] and d[3] == d[4]: 50 else: 0
