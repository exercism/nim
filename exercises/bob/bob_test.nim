import unittest
import bob

# version 1.4.0

suite "Bob":
  test "stating something":
    check hey("Tom-ay-to, tom-aaaah-to.") == "Whatever."

  test "shouting":
    check hey("WATCH OUT!") == "Whoa, chill out!"

  test "shouting gibberish":
    check hey("FCECDFCAAB") == "Whoa, chill out!"

  test "asking a question":
    check hey("Does this cryogenic chamber make me look fat?") == "Sure."

  test "asking a numeric question":
    check hey("You are, what, like 15?") == "Sure."

  test "asking gibberish":
    check hey("fffbbcbeab?") == "Sure."

  test "talking forcefully":
    check hey("Let's go make out behind the gym!") == "Whatever."

  test "using acronyms in regular speech":
    check hey("It's OK if you don't want to go to the DMV.") == "Whatever."

  test "forceful question":
    check hey("WHAT THE HELL WERE YOU THINKING?") == "Calm down, I know what I'm doing!"

  test "shouting numbers":
    check hey("1, 2, 3 GO!") == "Whoa, chill out!"

  test "no letters":
    check hey("1, 2, 3") == "Whatever."

  test "question with no letters":
    check hey("4?") == "Sure."

  test "shouting with special characters":
    check hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") == "Whoa, chill out!"

  test "shouting with no exclamation mark":
    check hey("I HATE THE DMV") == "Whoa, chill out!"

  test "statement containing question mark":
    check hey("Ending with ? means a question.") == "Whatever."

  test "non-letters with question":
    check hey(":) ?") == "Sure."

  test "prattling on":
    check hey("Wait! Hang on. Are you going to be OK?") == "Sure."

  test "silence":
    check hey("") == "Fine. Be that way!"

  test "prolonged silence":
    check hey("          ") == "Fine. Be that way!"

  test "alternate silence":
    check hey("\t\t\t\t\t\t\t\t\t\t") == "Fine. Be that way!"

  test "multiple line question":
    check hey("\nDoes this cryogenic chamber make me look fat?\nNo.") == "Whatever."

  test "starting with whitespace":
    check hey("         hmmmmmmm...") == "Whatever."

  test "ending with whitespace":
    check hey("Okay if like my  spacebar  quite a bit?   ") == "Sure."

  test "other whitespace":
    check hey("\n\r \t") == "Fine. Be that way!"

  test "non-question ending with whitespace":
    check hey("This is a statement ending with whitespace      ") == "Whatever."
