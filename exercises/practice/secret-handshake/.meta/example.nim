import std/[algorithm, bitops]

type
  Action* = enum
    Wink, DoubleBlink, CloseEyes, Jump, Reverse

func commands*(n: Natural): seq[Action] =
  result = newSeqOfCap[Action](Action.high.ord)

  for action in Action:
    if n.testBit(action.ord):
      case action
      of Wink..Jump:
        result.add action
      of Reverse:
        result.reverse()
