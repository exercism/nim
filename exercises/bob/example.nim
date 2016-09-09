from strutils import endsWith
from unicode import isLower, isUpper, isWhiteSpace, runes

proc isSilence(s: string): bool =
  for r in runes(s):
    if not isWhiteSpace(r):
      return false
  return true

proc isYelling(s: string): bool =
  var nUpperRunes = 0
  for r in runes(s):
    if isLower(r):
      return false
    elif isUpper(r):
      inc(nUpperRunes)
  return nUpperRunes > 0

proc isQuestion(s: string): bool =
  return s.endsWith("?")

proc hey*(msg: string): string {.noSideEffect.} =
  ## Returns the response of a lackadaisical teenager to a futile attempt to
  ## communicate with him.
  ##
  ## .. code-block:: nimrod
  ##   let greeting = "Hi, Bob!"
  ##   assert hey(greeting) == "Whatever."
  ##
  ##   let question == "What's up, Bob?"
  ##   assert hey(question) == "Sure."
  ##
  ##   let rage = "TALK TO ME!!!"
  ##   assert hey(rage) == "Whoa, chill out!"
  ##
  ##   let resignation = ""
  ##   assert hey(resignation) == "Fine. Be that way!"
  if isSilence(msg):
    return "Fine. Be that way!"
  elif isYelling(msg):
    return "Whoa, chill out!"
  elif isQuestion(msg):
    return "Sure."
  else:
    return "Whatever."
