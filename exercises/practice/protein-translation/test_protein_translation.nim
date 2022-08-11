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

  test "STOP codon RNA sequence 1":
    check translate("UAA").len == 0

  test "STOP codon RNA sequence 2":
    check translate("UAG").len == 0

  test "STOP codon RNA sequence 3":
    check translate("UGA").len == 0

  test "translates RNA strand into correct protein":
    check translate("AUGUUUUGG") == @["Methionine", "Phenylalanine", "Tryptophan"]

  test "stops translation if STOP codon at beginning of sequence":
    check translate("UAGUGG").len == 0

  test "stops translation if STOP codon at end of two-codon sequence":
    check translate("UGGUAG") == @["Tryptophan"]

  test "stops translation if STOP codon at end of three-codon sequence":
    check translate("AUGUUUUAA") == @["Methionine", "Phenylalanine"]

  test "stops translation if STOP codon in middle of three-codon sequence":
    check translate("UGGUAGUGG") == @["Tryptophan"]

  test "stops translation if STOP codon in middle of six-codon sequence":
    check translate("UGGUGUUAUUAAUGGUUU") == @["Tryptophan", "Cysteine", "Tyrosine"]
