import unittest
import grade_school

suite "Grade School":
  test "roster is empty when no student is added":
    var school = School()
    check school.roster().len == 0

  block:
    var school = School()
    test "add a student":
      school.addStudent("Aimee", 2)

    test "student is added to the roster":
      check school.roster() == @["Aimee"]

  block:
    var school = School()
    test "adding multiple students in the same grade in the roster":
      school.addStudent("Blair", 2)
      school.addStudent("James", 2)
      school.addStudent("Paul", 2)

    test "multiple students in the same grade are added to the roster":
      check school.roster() == @["Blair", "James", "Paul"]

  block:
    var school = School()
    test "cannot add student to same grade in the roster more than once":
      school.addStudent("Blair", 2)
      school.addStudent("James", 2)
      expect ValueError:
        school.addStudent("James", 2)
      school.addStudent("Paul", 2)

    test "student not added to same grade in the roster more than once":
      check school.roster() == @["Blair", "James", "Paul"]

  block:
    var school = School()
    test "adding students in multiple grades":
      school.addStudent("Chelsea", 3)
      school.addStudent("Logan", 7)

    test "students in multiple grades are added to the roster":
      check school.roster() == @["Chelsea", "Logan"]

  block:
    var school = School()
    test "cannot add same student to multiple grades in the roster":
      school.addStudent("Blair", 2)
      school.addStudent("James", 2)
      expect ValueError:
        school.addStudent("James", 3)
      school.addStudent("Paul", 3)

    test "student not added to multiple grades in the roster":
      check school.roster() == @["Blair", "James", "Paul"]

  test "students are sorted by grades in the roster":
    var school = School()
    school.addStudent("Jim", 3)
    school.addStudent("Peter", 2)
    school.addStudent("Anna", 1)
    check school.roster() == @["Anna", "Peter", "Jim"]

  test "students are sorted by name in the roster":
    var school = School()
    school.addStudent("Peter", 2)
    school.addStudent("Zoe", 2)
    school.addStudent("Alex", 2)
    check school.roster() == @["Alex", "Peter", "Zoe"]

  test "students are sorted by grades and then by name in the roster":
    var school = School()
    school.addStudent("Peter", 2)
    school.addStudent("Anna", 1)
    school.addStudent("Barb", 1)
    school.addStudent("Zoe", 2)
    school.addStudent("Alex", 2)
    school.addStudent("Jim", 3)
    school.addStudent("Charlie", 1)
    check school.roster() == @["Anna", "Barb", "Charlie", "Alex", "Peter",
                               "Zoe", "Jim"]

  test "grade is empty if no students in the roster":
    var school = School()
    check school.grade(1).len == 0

  test "grade is empty if no students in that grade":
    var school = School()
    school.addStudent("Peter", 2)
    school.addStudent("Zoe", 2)
    school.addStudent("Alex", 2)
    school.addStudent("Jim", 3)
    check school.grade(1).len == 0

  test "student not added to same grade more than once":
    var school = School()
    school.addStudent("Blair", 2)
    school.addStudent("James", 2)
    expect ValueError:
      school.addStudent("James", 2)
    school.addStudent("Paul", 2)
    check school.grade(2) == @["Blair", "James", "Paul"]

  test "student not added to multiple grades":
    var school = School()
    school.addStudent("Blair", 2)
    school.addStudent("James", 2)
    expect ValueError:
      school.addStudent("James", 3)
    school.addStudent("Paul", 3)
    check school.grade(2) == @["Blair", "James"]

  test "student not added to other grade for multiple grades":
    var school = School()
    school.addStudent("Blair", 2)
    school.addStudent("James", 2)
    expect ValueError:
      school.addStudent("James", 3)
    school.addStudent("Paul", 3)
    check school.grade(3) == @["Paul"]

  test "students are sorted by name in a grade":
    var school = School()
    school.addStudent("Franklin", 5)
    school.addStudent("Bradley", 5)
    school.addStudent("Jeff", 1)
    check school.grade(5) == @["Bradley", "Franklin"]
