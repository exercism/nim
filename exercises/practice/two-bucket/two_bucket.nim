type
  MeasureResult* = object
    possible*: bool
    moves*: int
    goalBucket*: string
    otherBucket*: int

proc measure*(bucket1, bucket2, goal: int, startBucket: string): MeasureResult =
  discard
