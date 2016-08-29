import unittest

import rna_transcription

test "transcribes G to C":
  check toRna("G") == "C"

test "transcribes C to G":
  check toRna("C") == "G"

test "transcribes T to A":
  check toRna("T") == "A"

test "transcribes A to U":
  check toRna("A") == "U"

test "transcribe all occurrences":
  check toRna("ACGTGGTCTTAA") == "UGCACCAGAAUU"

test "raise ValueError on invalid nucleotide":
  expect(ValueError):
    discard toRna("Q")
