const lookup = block:
  const raindrops = [
    (3, "Pling"),
    (5, "Plang"),
    (7, "Plong"),
  ]

  func calcPeriod(a: openArray[(int, string)]): int =
    ## Returns the product of the integers in `a`.
    result = 1
    for (n, _) in a:
      result *= n

  func genLookup: array[calcPeriod(raindrops), string] =
    for i, s in result.mpairs:
      for (n, sound) in raindrops:
        if i mod n == 0:
          s.add sound
      if s.len == 0:
        s = $i

  genLookup() ## Creates lookup at compile time.

func convert*(n: int): string =
  lookup[n mod lookup.len]
