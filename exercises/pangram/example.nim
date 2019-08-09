import strutils

const
    asciiLowercase = {'a'..'z'}

proc isPangram*(sentence:string): bool =
  for c in asciiLowercase:
    if c notin sentence.toLowerAscii: return false
  return true
