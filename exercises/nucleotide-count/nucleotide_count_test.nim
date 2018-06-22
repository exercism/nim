import tables
import unittest
import nucleotide_count

suite "Nucleotide":
  
  test "count empty string":
    check count('A', "") == 0

  test "count repetitive cytosine":
    check count('C', "CCCCC") == 5

  test "count only thymine":
    check count('T', "GGGGGTAACCCGG") == 1

  test "countDna empty":
    check len(countDna("")) == 0

  test "countDna only guanine":
    let counts = countDna("GGGGGGGG")
    check counts['G'] == 8

  test "countDna counts all":
    let counts = countDna("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
    check counts['A'] == 20
    check counts['C'] == 12
    check counts['T'] == 21
    check counts['G'] == 17
