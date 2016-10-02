proc toRna*(strand: string): string =
  var rna = ""

  for c in strand:
    case c
    of 'A':
      rna &= 'U'
    of 'G':
      rna &= 'C'
    of 'C':
      rna &= 'G'
    of 'T':
      rna &= 'A'
    else:
      raise newException(ValueError, "Invalid nucleotide")

  rna
