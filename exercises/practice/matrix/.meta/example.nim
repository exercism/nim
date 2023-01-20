import std/strutils

func matrix(s: string): seq[seq[int]] =
  for line in s.splitLines:
    var row = newSeq[int]()
    for n in line.split:
      row.add n.parseInt
    result.add row

func row*(s: string, i: int): seq[int] =
  matrix(s)[i-1]

func column*(s: string, i: int): seq[int] =
  for row in matrix(s):
    result.add row[i-1]
