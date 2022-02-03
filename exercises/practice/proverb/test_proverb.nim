import
  std / unittest

import
  proverb

suite "proverb tests":
  test "zero pieces":
    check recite(newSeq[int]()) == newSeq[int]()
  test "one piece":
    check recite(@["nail"]) == @["And all for the want of a nail."]
  test "two pieces":
    check recite(@["nail", "shoe"]) ==
        @["For want of a nail the shoe was lost.",
          "And all for the want of a nail."]
  test "three pieces":
    check recite(@["nail", "shoe", "horse"]) ==
        @["For want of a nail the shoe was lost.",
          "For want of a shoe the horse was lost.",
          "And all for the want of a nail."]
  test "full proverb":
    check recite(@["nail", "shoe", "horse", "rider", "message", "battle",
                   "kingdom"]) ==
        @["For want of a nail the shoe was lost.",
          "For want of a shoe the horse was lost.",
          "For want of a horse the rider was lost.",
          "For want of a rider the message was lost.",
          "For want of a message the battle was lost.",
          "For want of a battle the kingdom was lost.",
          "And all for the want of a nail."]
  test "four pieces modernized":
    check recite(@["pin", "gun", "soldier", "battle"]) ==
        @["For want of a pin the gun was lost.",
          "For want of a gun the soldier was lost.",
          "For want of a soldier the battle was lost.",
          "And all for the want of a pin."]
