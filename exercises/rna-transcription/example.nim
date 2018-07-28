proc toRna*(strand: string): string =
  result = ""

  for c in strand:
    case c
    of 'A':
      result &= 'U'
    of 'G':
      result &= 'C'
    of 'C':
      result &= 'G'
    of 'T':
      result &= 'A'
    else:
      raise newException(ValueError, "Invalid nucleotide")
