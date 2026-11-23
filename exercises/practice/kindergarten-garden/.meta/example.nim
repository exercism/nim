type Plant* = enum
  Clover, Grass, Radishes, Violets

func toPlant(c: char): Plant =
  case c
  of 'C': Clover
  of 'G': Grass
  of 'R': Radishes
  of 'V': Violets
  else: Clover

func plants*(s: string, student: string): array[4, Plant] =
  var i = 0
  var j = 2 * (student[0].ord - 'A'.ord) # Index of the student's first plant.
  while j < s.len:
    result[i] = toPlant(s[j])
    result[i+1] = toPlant(s[j+1])
    i += 2
    j += 1 + s.high div 2
