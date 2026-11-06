type
  MeasureResult* = object
    possible*: bool
    moves*: int
    goalBucket*: string
    otherBucket*: int

proc measure*(bucket1, bucket2, goal: int, startBucket: string): MeasureResult =
  if startBucket == "two":
    result = measure(bucket2, bucket1, goal, "one")
    result.goalBucket = if result.goalBucket == "one": "two" else: "one"
    return result

  if goal == 0: return MeasureResult(
    possible: true, moves: 0, goalBucket: "one", otherBucket: 0)
  if goal == bucket1: return MeasureResult(
    possible: true, moves: 1, goalBucket: "one", otherBucket: 0)
  if goal == bucket2: return MeasureResult(
    possible: true, moves: 2, goalBucket: "two", otherBucket: bucket1)

  var moves, vol1, vol2 = 0
  while vol1 != 0 or vol2 != bucket2:
    moves.inc 2

    if vol1 == 0:
      vol1 = bucket1
    else:
      vol2 = 0

    if vol1 + vol2 > bucket2:
      (vol1, vol2) = (vol1 + vol2 - bucket2, bucket2)
      if vol1 == goal: return MeasureResult(
        possible: true, moves: moves, goalBucket: "one", otherBucket: vol2)
    else:
      (vol1, vol2) = (0, vol1 + vol2)
      if vol2 == goal: return MeasureResult(
        possible: true, moves: moves, goalBucket: "two", otherBucket: vol1)
