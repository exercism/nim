import unittest

import hamming

test "no difference between identical strands":
  check distance("A", "A") == 0

test "complate Hamming distance for single nucleotide strand":
  check distance("A", "G") == 1

test "complete Hamming distance for small strand":
  check distance("AG", "CT") == 2

test "small Hamming distance":
  check distance("AT", "CT") == 1

test "small Hamming distance in longer strand":
  check distance("GGACG", "GGTCG") == 1

test "large Hamming distance":
  check distance("GATACA", "GCATAA") == 4

test "Hamming distance in a very large strand":
  check distance("GGACGGATTCTG", "AGGACGGATTCT") == 9
