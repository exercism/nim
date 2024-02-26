type
  measureResult* = tuple
    possible: bool
    moves: int
    goalBucket: string
    otherBucket: int

proc measure*(bucket1, bucket2, goal: int, startBucket: string): measureResult =
  discard
