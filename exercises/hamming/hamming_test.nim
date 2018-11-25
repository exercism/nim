import unittest

import hamming

suite "Hamming":

  test "empty strands":
    check distance("", "") == 0
  
  test "identical strands":
    check distance("A", "A") == 0

  test "long identical strands":
    check distance("GGACTGA", "GGACTGA") == 0

  test "complete distance in single nucleotide strands":
    check distance("A", "G") == 1

  test "complete distance in small strands":
    check distance("AG", "CT") == 2

  test "small distance in small strands":
    check distance("AT", "CT") == 1

  test "small distance":
    check distance("GGACG", "GGTCG") == 1

  test "small distance in long strands":
    check distance("ACCAGGG", "ACTATGG") == 2

  test "non-unique character in first strand":
    check distance("AAG", "AAA") == 1

  test "non-unique character in second strand":
    check distance("AAA", "AAG") == 1

  test "same nucleotides in different positions":
    check distance("TAG", "GAT") == 2

  test "large distance":
    check distance("GATACA", "GCATAA") == 4

  test "large distance in off-by-one strand":
    check distance("GGACGGATTCTG", "AGGACGGATTCT") == 9

  test "disallow first strand longer":
    expect(ValueError):
      discard distance("AATG", "AAA")

  test "disallow second strand longer":
    expect(ValueError):
      discard distance("ATA", "AGTG")