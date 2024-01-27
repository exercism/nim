proc append*(list1, list2: seq[int]): seq[int] =
  discard

proc concatenate*(lists: seq[seq[int]]): seq[int] =
  discard

proc filter*(list: seq[int], predicate: proc(x: int): bool): seq[int] =
  discard

proc length*(list: seq[int]): int =
  discard

proc map*(list: seq[int], function: proc(x: int): int): seq[int] =
  discard

proc foldl*(list: seq[int], function: proc(x, y: int): int, accumulator: int): int =
  discard

proc foldr*(list: seq[int], function: proc(x, y: int): int, accumulator: int): int =
  discard

proc reverse*(list: seq[int]): seq[int] =
  discard
