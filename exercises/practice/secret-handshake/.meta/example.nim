import std/algorithm

type
  Action* = enum
    Wink, DoubleBlink, CloseEyes, Jump, Reverse

func has(n: Natural, action: Action): bool =
  (n and 1 shl action.ord) != 0

func commands*(n: Natural): seq[Action] =
  result = newSeqOfCap[Action](Action.high.ord)

  for action in Wink..Jump:
    if n.has(action):
      result.add action

  if n.has(Reverse):
    reverse result
