import std/algorithm

func latest*(scores: openArray[int]): int =
  scores[^1]

func personalBest*(scores: openArray[int]): int =
  scores.max

func personalTopThree*(scores: openArray[int]): seq[int] =
  result = scores.sorted(order = Descending)
  result.setLen min(3, scores.len)
