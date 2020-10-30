import unittest
import hamming

suite "Hamming":
  test "empty strands":
    check distance("", "") == 0

  test "single letter identical strands":
    check distance("A", "A") == 0

  test "single letter different strands":
    check distance("G", "T") == 1

  test "long identical strands":
    check distance("GGACTGAAATCTG", "GGACTGAAATCTG") == 0

  test "long different strands":
    check distance("GGACGGATTCTG", "AGGACGGATTCT") == 9

  test "disallow first strand longer":
    expect(ValueError):
      discard distance("AATG", "AAA")

  test "disallow second strand longer":
    expect(ValueError):
      discard distance("ATA", "AGTG")

  test "disallow left empty strand":
    expect(ValueError):
      discard distance("", "G")

  test "disallow right empty strand":
    expect(ValueError):
      discard distance("G", "")
