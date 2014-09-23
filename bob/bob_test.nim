import unittest
from bob import hey

suite "hey tests":
  test "stating something":
    check hey("Tom-ay-to, tom-aaaah-to.") == "Whatever."

  test "shouting":
    check hey("WATCH OUT!") == "Whoa, chill out!"

  test "asking a question":
    check hey("Does this cryogenic chamber make me look fat?") == "Sure."

  test "asking a numeric question":
    check hey("You are, what, like 15?") == "Sure."

  test "talking forcefully":
    check hey("Let's go make out behind the gym!") == "Whatever."

  test "using acronyms in regular speech":
    check hey("It's OK if you don't want to go to the DMV.") == "Whatever."

  test "forceful questions":
    check hey("WHAT THE HELL WERE YOU THINKING?") == "Whoa, chill out!"

  test "shouting numbers":
    check hey("1, 2, 3 GO!") == "Whoa, chill out!"

  test "only numbers":
    check hey("1, 2, 3") == "Whatever."

  test "question with only numbers":
    check hey("4?") == "Sure."

  test "shouting with special characters":
    check hey("ZOMG THE %^*@#$(^ ZOMBIES ARE COMING!!1!") == "Whoa, chill out!"

  test "shouting with umlauts":
    check hey("ÜMLÄÜTS!") == "Whoa, chill out!"

  test "calmly speaking with umlauts":
    check hey("Ümläüts!") == "Whatever."

  test "shouting with no exclamation mark":
    check hey("I HATE YOU") == "Whoa, chill out!"

  test "statement containing question mark":
    check hey("Ending with ? means a question.") == "Whatever."

  test "prattling on":
    check hey("Wait! Hang on. Are you going to be OK?") == "Sure."

  test "silence":
    check hey("") == "Fine. Be that way!"

  test "prolonged silence":
    check hey("    ") == "Fine. Be that way!"

  test "really prolonged silence":
    check hey("              \t\n") == "Fine. Be that way!"

  test "multi line trick question":
    check hey("Do I ever change my mind?\nNo.") == "Whatever."
