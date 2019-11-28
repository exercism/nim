import unittest
import robot_name

func isValidRobotName(s: string): bool =
  ## Returns true if `s` is two uppercase letters followed by three digits.
  s.len == 5 and
    s[0] in {'A'..'Z'} and
    s[1] in {'A'..'Z'} and
    s[2] in {'0'..'9'} and
    s[3] in {'0'..'9'} and
    s[4] in {'0'..'9'}

suite "Robot Name":
  test "robot has a valid name":
    var robot = makeRobot()
    check isValidRobotName(robot.name)

  test "name is persistent":
    var robot = makeRobot()
    let name1 = robot.name
    let name2 = robot.name
    check name1 == name2

  test "different robots have different names":
    let name1 = makeRobot().name
    let name2 = makeRobot().name
    check name1 != name2

  test "reset changes name":
    var robot = makeRobot()
    let nameBefore = robot.name
    robot.reset()
    let nameAfter = robot.name
    check:
      nameBefore != nameAfter
      isValidRobotName(nameAfter)

  # Bonus
  # This test is optional. Uncomment the lines below to enable it.

  # test "all remaining robot names are distinct":
  #   const n = (26 * 26 * 1000) - 6 # The number of names not generated above.
  #   var names = initHashSet[string](n.rightSize)
  #   for i in 1 .. n:
  #     names.incl(makeRobot().name)
  #   check names.len == n
