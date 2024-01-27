proc append*(list1, list2: seq[int]): seq[int] =
  discard

proc concatenate*(lists: seq[seq[int]]): seq[int] =
  discard

proc filter*(predicate: proc(x: int): bool, list: seq[int]): seq[int] =
  discard

proc length*(list: seq[int]): int =
  discard

proc map*(function: proc(x: int): int, list: seq[int]): seq[int] =
  discard

proc foldl*(function: proc(x, y: int): int, list: seq[int], accumulator: int): int =
  discard

proc foldr*(function: proc(x, y: int): int, list: seq[int], accumulator: int): int =
  discard

proc reverse*(list: seq[int]): seq[int] =
  discard
