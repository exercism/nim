# Resistor Color Duo

If you want to build something using a Raspberry Pi, you'll probably use _resistors_. For this exercise, you need to know two things about them:

* Each resistor has a resistance value.
* Resistors are small - so small in fact that if you printed the resistance value on them, it would be hard to read.
To get around this problem, manufacturers print color-coded bands onto the resistors to denote their resistance values. Each band acts as a digit of a number. For example, if they printed a brown band (value 1) followed by a green band (value 5), it would translate to the number 15.

In this exercise, you are going to create a helpful program so that you don't have to remember the values of the bands. The program will take two colors as input, and output the correct number.

The band colors are encoded as follows:

- Black: 0
- Brown: 1
- Red: 2
- Orange: 3
- Yellow: 4
- Green: 5
- Blue: 6
- Violet: 7
- Grey: 8
- White: 9

## Running the tests

To compile and run the tests, just run the following in your exercise directory:
```bash
$ nim c -r resistor_color_duo_test.nim
```

## Submitting Exercises

Note that, when trying to submit an exercise, make sure the solution is in the `$EXERCISM_WORKSPACE/nim/resistor-color-duo` directory.

You can find your Exercism workspace by running `exercism debug` and looking for the line that starts with `Exercises Directory`.

## Need help?

These guides should help you,
* [Installing Nim](https://exercism.io/tracks/nim/installation)
* [Running the Tests](https://exercism.io/tracks/nim/tests)
* [Learning Nim](https://exercism.io/tracks/nim/learning)
* [Useful Nim Resources](https://exercism.io/tracks/nim/resources)


## Source

Maud de Vries, Erik Schierboom [https://github.com/exercism/problem-specifications/issues/1464](https://github.com/exercism/problem-specifications/issues/1464)

## Submitting Incomplete Solutions

It's possible to submit an incomplete solution so you can see how others have completed the exercise.
