import
  tables, deques, sequtils

const
  lookupTable = {'(': ')', '{': '}', '[': ']'}.toTable

proc hasValue[A, B](t: Table[A, B], value: B): bool =
  value in toSeq(t.values)

proc isPaired*(value: string): bool =
  var stack = initDeque[char]()

  for item in value:
    if item in lookupTable:
      stack.addLast(item)
    if lookupTable.hasValue(item):
      if len(stack) == 0:
        return false
      if lookupTable[stack.popLast()] != item:
        return false

  return len(stack) == 0