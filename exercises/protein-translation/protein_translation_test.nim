import unittest
import protein_translation

suite "Protein Translation":
  test "identifies Methionine codon":
    check translate("AUG") == @["Methionine"]

  test "identifies Phenylalanine codons":
    for codon in ["UUU", "UUC"]:
      check translate(codon) == @["Phenylalanine"]

  test "identifies Leucine codons":
    for codon in ["UUA", "UUG"]:
      check translate(codon) == @["Leucine"]

  test "identifies Serine codons":
    for codon in ["UCU", "UCC", "UCA", "UCG"]:
      check translate(codon) == @["Serine"]

  test "identifies Tyrosine codons":
    for codon in ["UAU", "UAC"]:
      check translate(codon) == @["Tyrosine"]

  test "identifies Cysteine codons":
    for codon in ["UGU", "UGC"]:
      check translate(codon) == @["Cysteine"]

  test "identifies Tryptophan codon":
    check translate("UGG") == @["Tryptophan"]

  test "identifies STOP codons":
    for codon in ["UAA", "UAG", "UGA"]:
      check translate(codon).len == 0

  test "translates RNA strand into correct protein":
    const strand = "AUGUUUUGG"
    const expected = @["Methionine", "Phenylalanine", "Tryptophan"]
    check translate(strand) == expected

  test "stops translation if STOP codon at beginning of sequence":
    const strand = "UAGUGG"
    check translate(strand).len == 0

  test "stops translation if STOP codon at end of two-codon sequence":
    const strand = "UGGUAG"
    const expected = @["Tryptophan"]
    check translate(strand) == expected

  test "stops translation if STOP codon at end of three-codon sequence":
    const strand = "AUGUUUUAA"
    const expected = @["Methionine", "Phenylalanine"]
    check translate(strand) == expected

  test "stops translation if STOP codon in middle of three-codon sequence":
    const strand = "UGGUAGUGG"
    const expected = @["Tryptophan"]
    check translate(strand) == expected

  test "stops translation if STOP codon in middle of six-codon sequence":
    const strand = "UGGUGUUAUUAAUGGUUU"
    const expected = @["Tryptophan", "Cysteine", "Tyrosine"]
    check translate(strand) == expected
