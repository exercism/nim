type Plant* = enum
  Clover, Grass, Radishes, Violets

func plants*(s: string, student: string): seq[Plant] =
  # Use the first letter of a student's name to find their plants
  let i = 2 * (student[0].ord - 'A'.ord)  # index of their first plant in the first row
  let j = (s.high div 2) + 1 + i          # index of their first plant in the second row
  let theirPlants = s[i .. i+1] & s[j .. j+1]

  for c in theirPlants:
    case c
    of 'C': result &= Clover
    of 'G': result &= Grass
    of 'R': result &= Radishes
    of 'V': result &= Violets
    else: discard
