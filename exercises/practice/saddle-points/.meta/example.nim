import sequtils

func saddlePoints*(matrix: seq[seq[int]]): seq[tuple[r, c: int]] =
  if matrix.len == 0:
    return

  var colMins = newSeqWith(matrix[0].len, int.high)
  for r, row in matrix:
    for c, _ in row:
      colMins[c] = min(colMins[c], matrix[r][c])

  for r, row in matrix:
    let rowMax = row.max
    for c, _ in row:
      if rowMax == colMins[c]:
        result.add (r+1, c+1)
