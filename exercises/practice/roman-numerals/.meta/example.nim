const arabicToRoman = {
  1000: "M", 900: "CM", 500: "D", 400: "CD",
   100: "C",  90: "XC",  50: "L",  40: "XL",
    10: "X",   9: "IX",   5: "V",   4: "IV",
     1: "I",
}

func roman*(n: int): string =
  result = ""
  var n = n
  for (a, r) in arabicToRoman:
    while n >= a:
      result.add r
      n -= a
