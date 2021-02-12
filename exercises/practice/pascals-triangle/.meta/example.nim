func createTriangle(n: int): seq[seq[int]] =
  result = @[@[1]]

  for i in 1 .. n:
    var row = newSeqOfCap[int](n)
    row &= 1
    for j in 1 ..< i:
      row &= result[i-1][j-1] + result[i-1][j]
    row &= 1
    result &= row

const p = createTriangle(30) # Generate rows of the triangle at compile-time.

func pascal*(n: int): seq[seq[int]] =
  p[0 ..< n]
