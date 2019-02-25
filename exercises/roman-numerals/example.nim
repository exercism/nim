type
  Numeral = tuple[number: int, roman: string]
  NumeralArray = array[13, Numeral]

let
  numeral_mapping: NumeralArray = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]


proc roman*(number: int): string =
  result = ""
  var n = number
  for numeral in numeral_mapping:
    while n >= numeral.number:
      result = result & numeral.roman
      n = n - numeral.number
