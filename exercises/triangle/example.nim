import sequtils

proc valid(a, b, c: int): bool =
  let greatThenZero = all([a, b, c], proc (x: int): bool = return x > 0)
  let equalityCheck = (a + b >= c) and (a + c >= b) and (b + c >= a)

  greatThenZero and equalityCheck

proc isEquilateral*(sides: array[3, int]): bool =
  let a = sides[0]
  let b = sides[1]
  let c = sides[2]
  valid(a, b, c) and all(sides, proc (x: int): bool = return a == x)

proc isIsosceles*(sides: array[3, int]): bool =
  let a = sides[0]
  let b = sides[1]
  let c = sides[2]
  valid(a, b, c) and (a == b or b == c or a == c)

proc isScalene*(sides: array[3, int]): bool =
  let a = sides[0]
  let b = sides[1]
  let c = sides[2]
  valid(a, b, c) and not isIsosceles(sides)
