import std/[algorithm, strformat]

type
  Student* = object
    name*: string
    grade*: int

  School* = object
    students*: seq[Student]

func roster*(school: School): seq[string] =
  ## Returns the names of every student in the `school`, sorted by grade then name.
  result = newSeq[string](school.students.len)
  for i, student in school.students.sortedByIt((it.grade, it.name)):
    result[i] = student.name

func addStudent*(school: var School, name: string, grade: int) =
  ## Adds a student with `name` and `grade` to the `school`.
  ##
  ## Raises a `ValueError` if `school` already contains a student named `name`.
  for student in school.students:
    if student.name == name:
      raise newException(ValueError, &"School already contains student: {name}")
  school.students.add Student(name: name, grade: grade)

func grade*(school: School, grade: int): seq[string] =
  ## Returns the names of the students in the given `school` and `grade`, in
  ## alphabetical order.
  result = @[]
  for student in school.students:
    if student.grade == grade:
      result.add student.name
  sort result
