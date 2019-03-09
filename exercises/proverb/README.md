# Proverb

For want of a horseshoe nail, a kingdom was lost, or so the saying goes.

Given a list of inputs, generate the relevant proverb. For example, given the list `["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]`, you will output the full text of this proverbial rhyme:

```text
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
```

Note that the list of inputs may vary; your solution should be able to handle lists of arbitrary length and content. No line of the output text should be a static, unchanging string; all should vary according to the input given.

## Running the tests

To compile and run the tests, just run the following in your exercise directory:
```bash
$ nim c -r proverb_test.nim
```

## Submitting Exercises

Note that, when trying to submit an exercise, make sure the solution is in the `$EXERCISM_WORKSPACE/nim/proverb` directory.

You can find your Exercism workspace by running `exercism debug` and looking for the line that starts with `Exercises Directory`.

## Need help?

These guides should help you,
* [Installing Nim](https://exercism.io/tracks/nim/installation)
* [Running the Tests](https://exercism.io/tracks/nim/tests)
* [Learning Nim](https://exercism.io/tracks/nim/learning)
* [Useful Nim Resources](https://exercism.io/tracks/nim/resources)


## Source

Wikipedia [http://en.wikipedia.org/wiki/For_Want_of_a_Nail](http://en.wikipedia.org/wiki/For_Want_of_a_Nail)

## Submitting Incomplete Solutions

It's possible to submit an incomplete solution so you can see how others have completed the exercise.
