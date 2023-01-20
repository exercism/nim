import std/strutils

func toDiamond(c: char): seq[string] =
  let rowLen = 2 * (c.ord - 'A'.ord) + 1
  let emptyRow = " ".repeat(rowLen)

  for ch in 'A' .. c:
    var row = emptyRow
    let i = c.ord - ch.ord
    row[i] = ch
    row[^(i + 1)] = ch
    result.add row
  for i in countdown(result.high - 1, 0):
    result.add result[i]

func generateDiamonds: seq[string] =
  for c in 'A'..'Z':
    result.add c.toDiamond.join("\n") & "\n"

const diamonds = generateDiamonds() # Generate all diamonds at compile-time.

func diamond*(c: char): string =
  diamonds[c.ord - 'A'.ord]
