proc reverse*(value: string): string =
  result = newString(value.len)
  for index, letter in value:
    result[value.high - index] = letter
