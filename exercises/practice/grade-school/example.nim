import algorithm, sequtils

type
  Student* = tuple[name: string, grade: int]
  School* = object
    students*: seq[Student]

proc roster*(s: School): seq[string] =
  s.students
    .sortedByIt((it.grade, it.name))
    .mapIt(it.name)

proc grade*(s: School, g: int): seq[string] =
  s.students
    .filter(proc(i: Student): bool = i.grade == g)
    .sortedByIt((it.grade, it.name))
    .mapIt(it.name)
