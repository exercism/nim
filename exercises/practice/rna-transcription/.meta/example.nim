func toRna*(strand: string): string =
  result = ""

  for c in strand:
    case c
    of 'A':
      result.add 'U'
    of 'G':
      result.add 'C'
    of 'C':
      result.add 'G'
    of 'T':
      result.add 'A'
    else:
      raise newException(ValueError, "Invalid nucleotide")
