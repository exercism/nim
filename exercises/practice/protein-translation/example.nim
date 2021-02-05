import tables

const codonToAminoAcid = {
  "AUG": "Methionine",
  "UUU": "Phenylalanine",
  "UUC": "Phenylalanine",
  "UUA": "Leucine",
  "UUG": "Leucine",
  "UCU": "Serine",
  "UCC": "Serine",
  "UCA": "Serine",
  "UCG": "Serine",
  "UAU": "Tyrosine",
  "UAC": "Tyrosine",
  "UGU": "Cysteine",
  "UGC": "Cysteine",
  "UGG": "Tryptophan",
  "UAA": "STOP",
  "UAG": "STOP",
  "UGA": "STOP",
}.toTable

func translate*(s: string): seq[string] =
  if s.len mod 3 != 0:
    raise newException(ValueError, "Invalid RNA sequence: " & s)

  for i in countup(0, s.high, 3):
    let codon = s[i..i+2]

    if codon notin codonToAminoAcid:
      raise newException(ValueError, "Unknown codon: " & codon)

    let aminoAcid = codonToAminoAcid[codon]
    if aminoAcid == "STOP":
      return
    else:
      result &= aminoAcid
