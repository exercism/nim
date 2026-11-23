func toRna*(s: string): string =
  result = newString(s.len)
  for i, c in s:
    result[i] =
      case c
      of 'A': 'U'
      of 'G': 'C'
      of 'C': 'G'
      of 'T': 'A'
      else:
        raise newException(ValueError, "Invalid nucleotide: " & c)
