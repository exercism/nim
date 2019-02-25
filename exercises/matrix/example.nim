import strutils

func matrix(s: string): seq[seq[int]] =
  for line in s.splitlines:
    var row = newSeq[int]()
    for n in line.split:
      row &= n.parseInt
    result &= row

func row*(s: string, i: int): seq[int] =
  matrix(s)[i-1]

func column*(s: string, i: int): seq[int] =
  for row in matrix(s):
    result &= row[i-1]
