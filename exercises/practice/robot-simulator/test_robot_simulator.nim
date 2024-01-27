import unittest
import robot_simulator

suite "Robot_Simulator":
  test "Create robot -> at origin facing north":
    var robot = initRobot()
    check robot.direction == North

  test "Create robot -> at negative position facing south":
    var robot = initRobot(South,-1,-1)
    check robot.direction == South
    check robot.xPos == -1 and robot.yPos == -1

  test "Rotating clockwise -> changes north to east":
    var robot = initRobot()
    robot.move("R")
    check robot.direction == East
    check robot.xPos == 0 and robot.yPos == 0

  test "Rotating clockwise -> changes east to south":
    var robot = initRobot(East)
    robot.move("R")
    check robot.direction == South
    check robot.xPos == 0 and robot.yPos == 0

  test "Rotating clockwise -> changes south to west":
    var robot = initRobot(South)
    robot.move("R")
    check robot.direction == West
    check robot.xPos == 0 and robot.yPos == 0

  test "Rotating clockwise -> changes west to north":
    var robot = initRobot(West)
    robot.move("R")
    check robot.direction == North
    check robot.xPos == 0 and robot.yPos == 0

  test "Rotating counter-clockwise -> changes north to west":
    var robot = initRobot()
    robot.move("L")
    check robot.direction == West
    check robot.xPos == 0 and robot.yPos == 0

  test "Rotating counter-clockwise -> changes west to south":
    var robot = initRobot(West)
    robot.move("L")
    check robot.direction == South
    check robot.xPos == 0 and robot.yPos == 0

  test "Rotating counter-clockwise -> changes south to east":
    var robot = initRobot(South)
    robot.move("L")
    check robot.direction == East
    check robot.xPos == 0 and robot.yPos == 0

  test "Rotating counter-clockwise -> changes east to north":
    var robot = initRobot(East)
    robot.move("L")
    check robot.direction == North
    check robot.xPos == 0 and robot.yPos == 0

  test "Moving forward one -> facing north increments Y":
    var robot = initRobot()
    robot.move("A")
    check robot.direction == North
    check robot.xPos == 0 and robot.yPos == 1

  test "Moving forward one -> facing south decrements Y":
    var robot = initRobot(South)
    robot.move("A")
    check robot.direction == South
    check robot.xPos == 0 and robot.yPos == -1

  test "Moving forward one -> facing east increments X":
    var robot = initRobot(East)
    robot.move("A")
    check robot.direction == East
    check robot.xPos == 1 and robot.yPos == 0

  test "Moving forward one -> facing west decrements X":
    var robot = initRobot(West)
    robot.move("A")
    check robot.direction == West
    check robot.xPos == -1 and robot.yPos == 0

  test "Follow series of instructions -> moving east and north from README":
    var robot = initRobot(North,7,3)
    robot.move("RAALAL")
    check robot.direction == West
    check robot.xPos == 9 and robot.yPos == 4

  test "Follow series of instructions -> moving west and north":
    var robot = initRobot()
    robot.move("LAAARALA")
    check robot.direction == West
    check robot.xPos == -4 and robot.yPos == 1

  test "Follow series of instructions -> moving west and south":
    var robot = initRobot(East,2,-7)
    robot.move("RRAAAAALA")
    check robot.direction == South
    check robot.xPos == -3 and robot.yPos == -8

  test "Follow series of instructions -> moving east and north":
    var robot = initRobot(South,8,4)
    robot.move("LAAARRRALLLL")
    check robot.direction == North
    check robot.xPos == 11 and robot.yPos == 5
