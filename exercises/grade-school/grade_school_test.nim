import unittest
import grade_school

# Given students' names along with the grade that they are in,
# create a roster for the school.

suite "Grade School":
  test "adding a student adds them to the sorted roster":
    let school = School(students: @[("Aimee", 2)])
    check school.roster() == @["Aimee"]

  test "adding more students adds them to the sorted roster":
    let school = School(students: @[("Blair", 2), ("James", 2), ("Paul", 2)])
    check school.roster() == @["Blair", "James", "Paul"]

  test "adding students to different grades adds them to the same sorted roster":
    let school = School(students: @[("Chelsea", 3), ("Logan", 7)])
    check school.roster() == @["Chelsea", "Logan"]

  test "roster returns an empty list if there are no students enrolled":
    let school = School(students: @[])
    let expected: seq[string] = @[]
    check school.roster() == expected

  test "roster is sorted by grade then name":
    let school = School(students: @[
      ("Peter", 2),
      ("Anna", 1),
      ("Barb", 1),
      ("Zoe", 2),
      ("Alex", 2),
      ("Jim", 3),
      ("Charlie", 1)
    ])
    check school.roster() == @["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"]

  test "grade returns the students in that grade in alphabetical order":
    let school = School(students: @[("Franklin", 5), ("Bradley", 5), ("Jeff", 1)])
    check school.grade(5) == @["Bradley", "Franklin"]

  test "grade returns an empty list if there are no students in that grade":
    let school = School(students: @[])
    let expected: seq[string] = @[]
    check school.grade(1) == expected
