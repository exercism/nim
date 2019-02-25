func toInt(c: char): int =
  ord(c) - ord('0')

func largestProduct*(s: string, span: int): int =
  if span > s.len or span < 0:
    raise newException(ValueError, "Invalid span: " & $span)
  if s.len == 0:
    return 1

  var product = 1
  var nZeros = 0

  for i, c in s:
    if c notin {'0'..'9'}:
      raise newException(ValueError, "Invalid character: " & c)

    if i >= span:
      let tail = toInt(s[i - span])
      if tail == 0:
        nZeros -= 1
      else:
        product = product div tail

    let head = toInt(c)
    if head == 0:
      nZeros += 1
    else:
      product *= head

    if nZeros == 0 and i >= span-1:
      result = max(result, product)
