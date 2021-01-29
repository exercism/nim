func toStr(s: set[char]): string =
  for c in s:
    result &= c

const alphabetLower = {'a'..'z'}.toStr # Generate alphabet at compile-time.
const alphabetUpper = {'A'..'Z'}.toStr

func rotate*(s: string, n: Natural): string =
  for c in s:
    if c in {'a'..'z'}:
      result &= alphabetLower[(c.ord + (n mod 26) - 'a'.ord) mod 26]
    elif c in {'A'..'Z'}:
      result &= alphabetUpper[(c.ord + (n mod 26) - 'A'.ord) mod 26]
    else:
      result &= c
