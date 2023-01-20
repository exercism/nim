import std/tables

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
  var codon = newString(3)
  for i in countup(0, s.high, 3):
    if i+2 < s.len:
      codon[0] = s[i]
      codon[1] = s[i+1]
      codon[2] = s[i+2]
      if codon in codonToAminoAcid:
        let aminoAcid = codonToAminoAcid[codon]
        if aminoAcid == "STOP":
          return
        else:
          result.add aminoAcid
      else:
        raise newException(ValueError, "Unknown codon: " & codon)
    else:
      raise newException(ValueError, "Invalid RNA sequence: " & s)
