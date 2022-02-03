import
  std / unittest

import
  grade_school

suite "grade-school tests":
  test "Roster is empty when no student is added":
    check roster(newSeq[int]()) == newSeq[int]()
  test "Add a student":
    check add(@[@["Aimee", 2]]) == @[true]
  test "Student is added to the roster":
    check roster(@[@["Aimee", 2]]) == @["Aimee"]
  test "Adding multiple students in the same grade in the roster":
    check add(@[@["Blair", 2], @["James", 2], @["Paul", 2]]) ==
        @[true, true, true]
  test "Multiple students in the same grade are added to the roster":
    check roster(@[@["Blair", 2], @["James", 2], @["Paul", 2]]) ==
        @["Blair", "James", "Paul"]
  test "Cannot add student to same grade in the roster more than once":
    check add(@[@["Blair", 2], @["James", 2], @["James", 2], @["Paul", 2]]) ==
        @[true, true, false, true]
  test "A student can\'t be in two different grades":
    check roster(@[@["Aimee", 2], @["Aimee", 1]], 2) == newSeq[int]()
  test "A student can only be added to the same grade in the roster once":
    check roster(@[@["Aimee", 2], @["Aimee", 2]]) == @["Aimee"]
  test "Student not added to same grade in the roster more than once":
    check roster(@[@["Blair", 2], @["James", 2], @["James", 2], @["Paul", 2]]) ==
        @["Blair", "James", "Paul"]
  test "Adding students in multiple grades":
    check add(@[@["Chelsea", 3], @["Logan", 7]]) == @[true, true]
  test "Students in multiple grades are added to the roster":
    check roster(@[@["Chelsea", 3], @["Logan", 7]]) == @["Chelsea", "Logan"]
  test "Cannot add same student to multiple grades in the roster":
    check add(@[@["Blair", 2], @["James", 2], @["James", 3], @["Paul", 3]]) ==
        @[true, true, false, true]
  test "A student cannot be added to more than one grade in the sorted roster":
    check roster(@[@["Aimee", 2], @["Aimee", 1]]) == @["Aimee"]
  test "Student not added to multiple grades in the roster":
    check roster(@[@["Blair", 2], @["James", 2], @["James", 3], @["Paul", 3]]) ==
        @["Blair", "James", "Paul"]
  test "Students are sorted by grades in the roster":
    check roster(@[@["Jim", 3], @["Peter", 2], @["Anna", 1]]) ==
        @["Anna", "Peter", "Jim"]
  test "Students are sorted by name in the roster":
    check roster(@[@["Peter", 2], @["Zoe", 2], @["Alex", 2]]) ==
        @["Alex", "Peter", "Zoe"]
  test "Students are sorted by grades and then by name in the roster":
    check roster(@[@["Peter", 2], @["Anna", 1], @["Barb", 1], @["Zoe", 2],
                   @["Alex", 2], @["Jim", 3], @["Charlie", 1]]) ==
        @["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"]
  test "Grade is empty if no students in the roster":
    check grade(newSeq[int](), 1) == newSeq[int]()
  test "Grade is empty if no students in that grade":
    check grade(@[@["Peter", 2], @["Zoe", 2], @["Alex", 2], @["Jim", 3]], 1) ==
        newSeq[int]()
  test "Student not added to same grade more than once":
    check grade(@[@["Blair", 2], @["James", 2], @["James", 2], @["Paul", 2]], 2) ==
        @["Blair", "James", "Paul"]
  test "Student not added to multiple grades":
    check grade(@[@["Blair", 2], @["James", 2], @["James", 3], @["Paul", 3]], 2) ==
        @["Blair", "James"]
  test "Student not added to other grade for multiple grades":
    check grade(@[@["Blair", 2], @["James", 2], @["James", 3], @["Paul", 3]], 3) ==
        @["Paul"]
  test "Students are sorted by name in a grade":
    check grade(@[@["Franklin", 5], @["Bradley", 5], @["Jeff", 1]], 5) ==
        @["Bradley", "Franklin"]
