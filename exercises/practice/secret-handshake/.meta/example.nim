import std/[algorithm, bitops]

type
  Action* = enum
    Wink, DoubleBlink, CloseEyes, Jump, Reverse

func commands*(n: Natural): seq[Action] =
  result = newSeqOfCap[Action](Action.high.ord)

  for action in Action:
    case action
    of Wink..Jump:
      if n.testBit(action.ord):
        result.add action
    of Reverse:
      if n.testBit(action.ord):
        reverse result
