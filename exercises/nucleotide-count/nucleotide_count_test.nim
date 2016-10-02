import tables
import unittest
import nucleotide_count

test "count empty string":
  check count('A', "") == 0

test "count repetitive cytosine":
  check count('C', "CCCCC") == 5

test "count only thymine":
  check count('T', "GGGGGTAACCCGG") == 1

test "count_dna empty":
  check len(count_dna("")) == 0

test "count_dna only guanine":
  let counts = count_dna("GGGGGGGG")
  check counts['G'] == 8

test "count_dna counts all":
  let counts = count_dna("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
  check counts['A'] == 20
  check counts['C'] == 12
  check counts['T'] == 21
  check counts['G'] == 17
