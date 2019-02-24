import 
    sequtils, algorithm

const
    signals = [
      "wink", 
      "double blink", 
      "close your eyes", 
      "jump"
    ]
    reverse_bit = 4


proc bitset(input: Natural, position: Natural): bool =
    (input and 1 shl position) != 0

proc commands*(input: Natural): seq[string] =
    for index, item in signals.pairs:
      if input.bitset(index):
        result.add(item)

    if input.bitset(reverse_bit):
      return result.reversed