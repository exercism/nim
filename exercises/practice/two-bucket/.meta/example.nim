type
  MeasureResult* = tuple
    possible: bool
    moves: int
    goalBucket: string
    otherBucket: int

proc measure*(bucket1, bucket2, goal: int, startBucket: string): MeasureResult =
  if startBucket == "two":
    result = measure(bucket2, bucket1, goal, "one")
    result.goalBucket = if result.goalBucket == "one": "two" else: "one"
    return result

  if goal == 0: return (true, 0, "one", 0)
  if goal == bucket1: return (true, 1, "one", 0)
  if goal == bucket2: return (true, 2, "two", bucket1)

  var moves, vol1, vol2 = 0
  while vol1 != 0 or vol2 != bucket2:
    moves.inc 2

    if vol1 == 0:
      vol1 = bucket1
    else:
      vol2 = 0

    if vol1 + vol2 > bucket2:
      (vol1, vol2) = (vol1 + vol2 - bucket2, bucket2)
      if vol1 == goal: return (true, moves, "one", vol2)
    else:
      (vol1, vol2) = (0, vol1 + vol2)
      if vol2 == goal: return (true, moves, "two", vol1)
