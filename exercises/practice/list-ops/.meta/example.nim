func append*(list1, list2: seq[int]): seq[int] =
  if list2.len == 0:
    return list1
  result = newSeq[int](list1.len + list2.len)
  var i = 0
  for x in list1:
    result[i] = x
    inc i
  for x in list2:
    result[i] = x
    inc i

func concatenate*(lists: openArray[seq[int]]): seq[int] =
  result = @[]
  for list in lists:
    result = append(result, list)

func filter*(list: openArray[int], predicate: proc(x: int): bool {.noSideEffect.}): seq[int] =
  result = @[]
  for x in list:
    if predicate(x):
      result.add x

func length*(list: openArray[int]): int =
  list.len

func map*(list: openArray[int], function: proc(x: int): int {.noSideEffect.}): seq[int] =
  result = newSeq[int](list.len)
  for i, x in list:
    result[i] = function(x)

func foldl*(list: openArray[int], function: proc(x, y: int): int {.noSideEffect.},
            accumulator: int): int =
  if list.len == 0:
    accumulator
  else:
    foldl(list[1..^1], function, function(accumulator, list[0]))

func foldr*(list: openArray[int], function: proc(x, y: int): int {.noSideEffect.},
            accumulator: int): int =
  if list.len == 0:
    accumulator
  else:
    function(foldr(list[1..^1], function, accumulator), list[0])

func reverse*(list: openArray[int]): seq[int] =
  result = newSeq[int](list.len)
  for i, x in list:
    result[list.high - i] = x
