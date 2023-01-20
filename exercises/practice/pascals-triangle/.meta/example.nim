func createTriangle(n: int): seq[seq[int]] =
  result = @[@[1]]

  for i in 1 .. n:
    var row = newSeqOfCap[int](n)
    row.add 1
    for j in 1 ..< i:
      row.add result[i-1][j-1] + result[i-1][j]
    row.add 1
    result.add row

const p = createTriangle(30) # Generate rows of the triangle at compile-time.

func pascal*(n: int): seq[seq[int]] =
  p[0 ..< n]
