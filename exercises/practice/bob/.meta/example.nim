import std/strutils

func isQuestion(s: string): bool =
  ## Returns whether the last non-space character in `s` is a question mark.
  var i = s.high
  while i >= 0 and s[i] == ' ':
    dec i
  i >= 0 and s[i] == '?'

func isYelling(s: string): bool =
  ## Returns whether `s` contains both an uppercase letter, and no lowercase letter.
  result = false
  for c in s:
    if c in {'a'..'z'}:
      return false
    elif c in {'A'..'Z'}:
      result = true

func hey*(s: string): string =
  if isEmptyOrWhitespace(s):
    "Fine. Be that way!"
  elif isQuestion(s):
    if isYelling(s):
      "Calm down, I know what I'm doing!"
    else:
      "Sure."
  elif isYelling(s):
    "Whoa, chill out!"
  else:
    "Whatever."
