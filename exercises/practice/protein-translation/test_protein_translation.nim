import unittest
import protein_translation

suite "Protein Translation":
  test "identifies Methionine codon":
    check translate("AUG") == @["Methionine"]

  test "Phenylalanine RNA sequence 1":
    check translate("UUU") == @["Phenylalanine"]

  test "Phenylalanine RNA sequence 2":
    check translate("UUC") == @["Phenylalanine"]

  test "Leucine RNA sequence 1":
    check translate("UUA") == @["Leucine"]

  test "Leucine RNA sequence 2":
    check translate("UUG") == @["Leucine"]

  test "Serine RNA sequence 1":
    check translate("UCU") == @["Serine"]

  test "Serine RNA sequence 2":
    check translate("UCC") == @["Serine"]

  test "Serine RNA sequence 3":
    check translate("UCA") == @["Serine"]

  test "Serine RNA sequence 4":
    check translate("UCG") == @["Serine"]

  test "Tyrosine RNA sequence 1":
    check translate("UAU") == @["Tyrosine"]

  test "Tyrosine RNA sequence 2":
    check translate("UAC") == @["Tyrosine"]

  test "Cysteine RNA sequence 1":
    check translate("UGU") == @["Cysteine"]

  test "Cysteine RNA sequence 2":
    check translate("UGC") == @["Cysteine"]

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
