import sequtils
import tables

proc count*(nt: char, dna: string): int =
  let nts = toSeq(dna.items)
  var nt_count = 0

  for n in nts:
    if n == nt:
      nt_count += 1

  nt_count

proc countDna*(dna: string): CountTable[char] =
  var counts = initCountTable[char]()

  for nt in toSeq(dna.items):
    if nt in ['A', 'C', 'G', 'T']:
      counts.inc(nt)
    else:
      raise newException(ValueError, "Invalid nucleotide")

  counts
