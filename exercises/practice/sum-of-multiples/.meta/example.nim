import std/intsets

func sum*(limit: int, factors: seq[int]): int =
  result = 0
  var nums = initIntSet()
  for f in factors:
    if f != 0:
      var n = f
      while n < limit:
        {.noSideEffect.}:
          if not nums.containsOrIncl(n):
            result += n
        n += f
