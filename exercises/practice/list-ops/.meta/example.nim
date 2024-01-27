proc append*(list1, list2: seq[int]): seq[int] =
  if list2.len == 0:
    return list1
  return append(list1 & list2[0], list2[1..^1])

proc concatenate*(lists: seq[seq[int]]): seq[int] =
  var newList = newSeq[int]()
  for list in lists:
    newList = append(newList, list)
  return newList

proc filter*(predicate: proc(x: int): bool, list: seq[int]): seq[int] =
  var newList = newSeq[int]()
  for x in list:
    if predicate(x):
      newList.add(x)
  return newList

proc length*(list: seq[int]): int =
  list.len

proc map*(function: proc(x: int): int, list: seq[int]): seq[int] =
  var newList = newSeq[int]()
  for x in list:
    newList.add(function(x))
  return newList

proc foldl*(function: proc(x, y: int): int, list: seq[int], accumulator: int): int =
  if list.len == 0:
    return accumulator
  return foldl(function, list[1..^1], function(accumulator, list[0]))

proc foldr*(function: proc(x, y: int): int, list: seq[int], accumulator: int): int =
  if list.len == 0:
    return accumulator
  return function(foldr(function, list[1..^1], accumulator), list[0])

proc reverse*(list: seq[int]): seq[int] =
  var newList = newSeq[int]()
  for x in list: newList.insert(x, 0)
  return newList
