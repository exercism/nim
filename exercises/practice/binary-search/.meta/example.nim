import std/algorithm

func binarySearch*(haystack: openArray[int], needle: int): int =
  binarySearch(haystack, needle, system.cmp[int])
  