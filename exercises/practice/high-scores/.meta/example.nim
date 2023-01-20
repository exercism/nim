import std/algorithm

func latest*(scores: openArray[int]): int =
  scores[^1]

func personalBest*(scores: openArray[int]): int =
  scores.max

func personalTopThree*(scores: openArray[int]): seq[int] =
  scores.sorted(order = Descending)[0 .. min(2, scores.high)]
