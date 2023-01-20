type Plant* = enum
  Clover, Grass, Radishes, Violets

func plants*(s: string, student: string): seq[Plant] =
  # Use the first letter of a student's name to find their plants.
  # i: The index of their first plant in the first row.
  # j: The index of their first plant in the second row.
  let i = 2 * (student[0].ord - 'A'.ord)
  let j = (s.high div 2) + 1 + i
  let theirPlants = s[i .. i+1] & s[j .. j+1]

  for c in theirPlants:
    case c
    of 'C': result.add Clover
    of 'G': result.add Grass
    of 'R': result.add Radishes
    of 'V': result.add Violets
    else: raise newException(ValueError, "Invalid plant: " & $c)
