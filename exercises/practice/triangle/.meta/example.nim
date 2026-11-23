type
  Triangle = array[3, int]

func isValid(t: Triangle): bool =
  for side in t:
    if side <= 0:
      return false
  (t[0] + t[1] >= t[2]) and (t[0] + t[2] >= t[1]) and (t[1] + t[2] >= t[0])

func isEquilateral*(t: Triangle): bool =
  isValid(t) and t[0] == t[1] and t[1] == t[2]

func isIsosceles*(t: Triangle): bool =
  isValid(t) and (t[0] == t[1] or t[1] == t[2] or t[0] == t[2])

func isScalene*(t: Triangle): bool =
  isValid(t) and not isIsosceles(t)
