import unittest, tables
import nucleotide_count

suite "Nucleotide Count":
  test "empty strand":
    let counts = countDna("")
    check counts.getOrDefault('A') == 0
    check counts.getOrDefault('C') == 0
    check counts.getOrDefault('G') == 0
    check counts.getOrDefault('T') == 0

  test "can count one nucleotide in single-character input":
    let counts = countDna("G")
    check counts.getOrDefault('A') == 0
    check counts.getOrDefault('C') == 0
    check counts.getOrDefault('G') == 1
    check counts.getOrDefault('T') == 0

  test "strand with repeated nucleotide":
    let counts = countDna("GGGGGGG")
    check counts.getOrDefault('A') == 0
    check counts.getOrDefault('C') == 0
    check counts.getOrDefault('G') == 7
    check counts.getOrDefault('T') == 0

  test "strand with multiple nucleotides":
    let counts = countDna("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCT" &
                          "CTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
    check counts['A'] == 20
    check counts['C'] == 12
    check counts['G'] == 17
    check counts['T'] == 21

  test "strand with invalid nucleotides":
    expect ValueError:
      discard countDna("AGXXACT")
