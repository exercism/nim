import intsets, random, strutils

type Robot = tuple[name: string]
const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
const numNames = 26 * 26 * 10 * 10 * 10
var nums = initIntSet()
nums.incl(numNames)
randomize()

func createLeadingZerosLookup: array[1000, string] =
  for i in 0 .. result.high:
    result[i] = i.`$`.align(3, '0')

const zeroPad = createLeadingZerosLookup()

func toName(n: Natural): string =
  let b = n div 1000
  let a = b div 26
  result = alphabet[a mod 26] & alphabet[b mod 26] & zeroPad[n mod 1000]

proc getUnusedName(s: var IntSet): string =
  var i = numNames
  # The below is faster than shuffling when generating a small number of names.
  while i in s:
    i = rand(numNames)
  s.incl(i)
  result = toName(i)

proc makeRobot*: Robot =
  result.name = getUnusedName(nums)

proc reset*(r: var Robot) =
  r.name = getUnusedName(nums)
