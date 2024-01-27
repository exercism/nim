proc append*(list1, list2: seq[int]): seq[int] =
  if list2.len == 0:
    list1
  else:
    append(list1 & list2[0], list2[1..^1])

proc concatenate*(lists: seq[seq[int]]): seq[int] =
  result = @[]
  for list in lists:
    result = append(result, list)

proc filter*(predicate: proc(x: int): bool, list: seq[int]): seq[int] =
  result = @[]
  for x in list:
    if predicate(x):
      result.add x

proc length*(list: seq[int]): int =
  list.len

proc map*(function: proc(x: int): int, list: seq[int]): seq[int] =
  result = newSeq[int](list.len)
  for i, x in list:
    result[i] = function(x)

proc foldl*(function: proc(x, y: int): int, list: seq[int], accumulator: int): int =
  if list.len == 0:
    accumulator
  else:
    foldl(function, list[1..^1], function(accumulator, list[0]))

proc foldr*(function: proc(x, y: int): int, list: seq[int], accumulator: int): int =
  if list.len == 0:
    accumulator
  else:
    function(foldr(function, list[1..^1], accumulator), list[0])

proc reverse*(list: seq[int]): seq[int] =
  result = newSeq[int](list.len)
  for i, x in list:
    result[list.high - i] = x
