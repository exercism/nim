import std/strutils

func matrix(s: string): seq[seq[int]] =
  result = @[]
  for line in s.splitLines:
    var row = newSeq[int]()
    for n in line.split:
      row.add n.parseInt
    result.add row

func row*(s: string, n: int): seq[int] =
  matrix(s)[n-1]

func column*(s: string, n: int): seq[int] =
  let m = matrix(s)
  result = newSeq[int](m.len)
  for i, row in m:
    result[i] = row[n-1]
