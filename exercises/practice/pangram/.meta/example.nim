import strutils

const
  asciiLowercase = {'a'..'z'}

func isPangram*(sentence: string): bool =
  let lowercaseSentence = sentence.toLowerAscii
  for c in asciiLowercase:
    if c notin lowercaseSentence: return false
  return true
