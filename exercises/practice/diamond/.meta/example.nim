import std/strutils

func toDiamond(c: 'A'..'Z'): string =
  let size = ord(c) - ord('A')
  let w = 2 * (size + 1)
  result = ' '.repeat(w * (w - 1))

  for i in 0 .. size:
    let ch = char('A'.ord + i)
    let middle = (i * w) + size
    result[middle - i] = ch
    result[middle + i] = ch
    result[middle + size + 1] = '\n'
    result[result.high - middle - i - 1] = ch
    result[result.high - middle + i - 1] = ch
    result[result.high - middle + size] = '\n'

func generateDiamonds: array['A'..'Z', string] =
  for c, s in result.mpairs:
    s = toDiamond(c)

func diamond*(c: 'A'..'Z'): string =
  const diamonds = generateDiamonds() # Generate all diamonds at compile-time.
  diamonds[c]
