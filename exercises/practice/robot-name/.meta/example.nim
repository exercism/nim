import std/random

type
  Name = array[5, char]
  Robot = object
    name*: Name

const numNames = 26 * 26 * 10 * 10 * 10
randomize()

proc shuffledNames: seq[Name] =
  result = newSeq[Name](numNames)
  var name: Name
  var i = 0

  for a in 'A'..'Z':
    name[0] = a
    for b in 'A'..'Z':
      name[1] = b
      for c in '0'..'9':
        name[2] = c
        for d in '0'..'9':
          name[3] = d
          for e in '0'..'9':
            name[4] = e
            result[i] = name
            inc(i)

  shuffle(result)

let names = shuffledNames()
var i = 0

proc getUnusedName: Name {.inline.} =
  # The tests do not currently specify the expected behavior on name exhaustion.
  # The below checks that a "wraparound" implementation is supported.
  result = names[i]
  i = if i > names.high: 0 else: i + 1

proc makeRobot*: Robot {.inline.} =
  result.name = getUnusedName()

proc reset*(r: var Robot) {.inline.} =
  r.name = getUnusedName()
