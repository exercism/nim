import unittest
import protein_translation

suite "Protein Translation":
  test "empty RNA sequence results in no proteins":
    check translate("").len == 0

  test "Methionine RNA sequence":
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

  test "Tryptophan RNA sequence":
    check translate("UGG") == @["Tryptophan"]

  test "STOP codon RNA sequence 1":
    check translate("UAA").len == 0

  test "STOP codon RNA sequence 2":
    check translate("UAG").len == 0

  test "STOP codon RNA sequence 3":
    check translate("UGA").len == 0

  test "sequence of two protein codons translates into proteins":
    check translate("UUUUUU") == @["Phenylalanine", "Phenylalanine"]

  test "sequence of two different protein codons translates into proteins":
    check translate("UUAUUG") == @["Leucine", "Leucine"]

  test "translate RNA strand into correct protein list":
    check translate("AUGUUUUGG") == @["Methionine", "Phenylalanine", "Tryptophan"]

  test "translation stops if STOP codon at beginning of sequence":
    check translate("UAGUGG").len == 0

  test "translation stops if STOP codon at end of two-codon sequence":
    check translate("UGGUAG") == @["Tryptophan"]

  test "translation stops if STOP codon at end of three-codon sequence":
    check translate("AUGUUUUAA") == @["Methionine", "Phenylalanine"]

  test "translation stops if STOP codon in middle of three-codon sequence":
    check translate("UGGUAGUGG") == @["Tryptophan"]

  test "translation stops if STOP codon in middle of six-codon sequence":
    check translate("UGGUGUUAUUAAUGGUUU") == @["Tryptophan", "Cysteine", "Tyrosine"]

  test "non-existing codon can't translate":
    expect ValueError:
      discard translate("AAA")

  test "unknown amino acids, not part of a codon, can't translate":
    expect ValueError:
      discard translate("XYZ")

  test "incomplete RNA sequence can't translate":
    expect ValueError:
      discard translate("AUGU")

  test "incomplete RNA sequence can translate if valid until a STOP codon":
    check translate("UUCUUCUAAUGGU") == @["Phenylalanine", "Phenylalanine"]
