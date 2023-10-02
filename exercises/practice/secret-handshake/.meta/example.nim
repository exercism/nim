import std/[algorithm, bitops]

type
  Action* = enum
    Wink, DoubleBlink, CloseEyes, Jump, Reverse

func has(n: Natural, action: Action): bool =
  testBit(n, action.ord)

func commands*(n: Natural): seq[Action] =
  result = newSeqOfCap[Action](Action.high.ord)

  for action in Wink..Jump:
    if n.has(action):
      result.add action

  if n.has(Reverse):
    reverse result
