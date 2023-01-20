import std/algorithm

const
  signals = [
    "wink",
    "double blink",
    "close your eyes",
    "jump"
  ]
  reverseBit = 4


func bitset(input: Natural, position: Natural): bool =
  (input and 1 shl position) != 0

func commands*(input: Natural): seq[string] =
  for index, item in signals:
    if input.bitset(index):
      result.add(item)

  if input.bitset(reverseBit):
    result.reverse
