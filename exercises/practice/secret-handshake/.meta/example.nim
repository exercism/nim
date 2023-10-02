import std/[algorithm, bitops]

type
  Action* = enum
    Wink, DoubleBlink, CloseEyes, Jump, Reverse

func commands*(n: Natural): seq[Action] =
  result = newSeqOfCap[Action](Action.high.ord)

  for action in Action.low ..< Action.high:
    if n.testBit(action.ord):
      result.add action

  if n.testBit(Reverse.ord):
    reverse result
