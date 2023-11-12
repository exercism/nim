const
  small = ["zero", "one", "two", "three", "four", "five", "six", "seven",
           "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen",
           "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy",
          "eighty", "ninety"]
  scale = ["thousand", "million", "billion"]

func modAndMaybeAddSep(s: var string, n: var int64, a: int, sep: char) =
  n = n mod a
  if n != 0:
    s.add sep

func addSmall(s: var string, n: int64) =
  var n = n
  if n >= 100:
    s.add small[n div 100]
    s.add " hundred"
    modAndMaybeAddSep(s, n, 100, ' ')
  if n >= 20:
    s.add tens[n div 10]
    modAndMaybeAddSep(s, n, 10, '-')
  if n > 0:
    s.add small[n]

func say*(n: int64): string =
  if n < 0 or n >= 1e12.int:
    raise newException(ValueError, "Number is out of range: " & $n)
  if n == 0:
    return small[n]

  result = ""
  var n = n
  for i, x in [1e9.int, 1e6.int, 1e3.int]:
    if n >= x:
      result.addSmall(n div x)
      result.add " "
      result.add scale[2-i]
      modAndMaybeAddSep(result, n, x, ' ')
  result.addSmall(n mod 1000)
