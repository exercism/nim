const
  small = ["zero", "one", "two", "three", "four", "five",
           "six", "seven", "eight", "nine", "ten", "eleven",
           "twelve", "thirteen", "fourteen", "fifteen",
           "sixteen", "seventeen", "eighteen", "nineteen"]
  tens = ["", "", "twenty", "thirty", "forty", "fifty",
          "sixty", "seventy", "eighty", "ninety"]
  scale = ["thousand", "million", "billion"]

func say*(n: int64): string

func leftover(sep: string, n: int64): string =
  if n == 0:
    ""
  else:
    sep & say(n)

func say*(n: int64): string =
  if n < 0 or n >= 1e12.int:
    raise newException(ValueError, "Number is out of range: " & $n)

  elif n < 20:
    return small[n]

  elif n < 100:
    return tens[n div 10] & leftover("-", n mod 10)

  elif n < 1000:
    return small[n div 100] & " hundred" & leftover(" ", n mod 100)

  for i, x in [1e3.int, 1e6.int, 1e9.int]:
    if n < x * 1000:
      return say(n div x) & " " & scale[i] & leftover(" ", n mod x)
