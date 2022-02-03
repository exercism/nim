import
  std / unittest

import
  bob

suite "bob tests":
  test "stating something":
    check response("Tom-ay-to, tom-aaaah-to.") == "Whatever."
  test "shouting":
    check response("WATCH OUT!") == "Whoa, chill out!"
  test "shouting gibberish":
    check response("FCECDFCAAB") == "Whoa, chill out!"
  test "asking a question":
    check response("Does this cryogenic chamber make me look fat?") == "Sure."
  test "asking a numeric question":
    check response("You are, what, like 15?") == "Sure."
  test "asking gibberish":
    check response("fffbbcbeab?") == "Sure."
  test "talking forcefully":
    check response("Hi there!") == "Whatever."
  test "using acronyms in regular speech":
    check response("It\'s OK if you don\'t want to go work for NASA.") ==
        "Whatever."
  test "forceful question":
    check response("WHAT\'S GOING ON?") == "Calm down, I know what I\'m doing!"
  test "shouting numbers":
    check response("1, 2, 3 GO!") == "Whoa, chill out!"
  test "no letters":
    check response("1, 2, 3") == "Whatever."
  test "question with no letters":
    check response("4?") == "Sure."
  test "shouting with special characters":
    check response("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") ==
        "Whoa, chill out!"
  test "shouting with no exclamation mark":
    check response("I HATE THE DENTIST") == "Whoa, chill out!"
  test "statement containing question mark":
    check response("Ending with ? means a question.") == "Whatever."
  test "non-letters with question":
    check response(":) ?") == "Sure."
  test "prattling on":
    check response("Wait! Hang on. Are you going to be OK?") == "Sure."
  test "silence":
    check response("") == "Fine. Be that way!"
  test "prolonged silence":
    check response("          ") == "Fine. Be that way!"
  test "alternate silence":
    check response("\t\t\t\t\t\t\t\t\t\t") == "Fine. Be that way!"
  test "multiple line question":
    check response("\nDoes this cryogenic chamber make me look fat?\nNo.") ==
        "Whatever."
  test "starting with whitespace":
    check response("         hmmmmmmm...") == "Whatever."
  test "ending with whitespace":
    check response("Okay if like my  spacebar  quite a bit?   ") == "Sure."
  test "other whitespace":
    check response("\n\r \t") == "Fine. Be that way!"
  test "non-question ending with whitespace":
    check response("This is a statement ending with whitespace      ") ==
        "Whatever."
