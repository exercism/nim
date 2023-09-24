func toClosing(c: char): char =
  case c
  of '(': ')'
  of '[': ']'
  of '{': '}'
  else: '\0'

func isPaired*(s: string): bool =
  ## Returns whether `(`, `[`, and `{` are matched and correctly nested in `s`.
  ## Caller guarantees that the nesting depth of those characters is at most 100.
  var stack {.noinit.} : array[100, char]
  var i = 0

  for c in s:
    if c in {'(', '[', '{'}:
      stack[i] = toClosing(c)
      inc i
    elif c in {')', ']', '}'}:
      if i > 0 and stack[i-1] == c: dec i else: return false

  i == 0
