import unittest
import robot_name

# You can implement the robot name as a `string` or an `array[5, char]`.
type
  RobotName = string | array[5, char]

func isValidRobotName(name: RobotName): bool =
  ## Returns true if `name` is two uppercase letters followed by three digits.
  when name is string:
    if name.len != 5:
      return false
  result =
    name[0] in {'A'..'Z'} and
    name[1] in {'A'..'Z'} and
    name[2] in {'0'..'9'} and
    name[3] in {'0'..'9'} and
    name[4] in {'0'..'9'}

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

  # The below test is optional. Change `runBonusTest` to `true` to run it.
  const runBonusTest = false

  when runBonusTest:
    func toInt(name: RobotName): int =
      ## Returns a unique integer for each valid robot name.
      (name[0].ord - 'A'.ord) * 26000 +
      (name[1].ord - 'A'.ord) * 1000 +
      (name[2].ord - '0'.ord) * 100 +
      (name[3].ord - '0'.ord) * 10 +
      (name[4].ord - '0'.ord)

    test "all remaining robot names are valid and distinct":
      const totalNames = 26 * 26 * 1000
      var nums = newSeq[bool](totalNames)
      const n = totalNames - 6 # The number of names not generated above.
      var countDuplicate = 0
      var countInvalid = 0

      for _ in 1 .. n:
        let name = makeRobot().name
        if isValidRobotName(name):
          let i = toInt(name)
          if nums[i]:
            inc(countDuplicate)
          else:
            nums[i] = true
        else:
          inc(countInvalid)
      check:
        countDuplicate == 0
        countInvalid == 0
