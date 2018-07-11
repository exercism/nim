# Word Count

Given a phrase, count the occurrences of each word in that phrase.

For example for the input `"olly olly in come free"`

```text
olly: 2
in: 1
come: 1
free: 1
```

The return from `countWords` is a `TableRef[string, int]`, which is a hash table (or dictionary in other programming languages) with a key of `string` and a value of `int`. Look at Nim's documentation on `tables` at https://nim-lang.org/docs/tables.html

For the procedure signature, the return will be of type `TableRef[string, int]`

```nim
proc countWords*(sentence: string): TableRef[string, int] =
  ...
```

## Running the tests

To compile and run the tests, just run the following in your exercise directory:
```bash
$ nim c -r word_count_test.nim
```

## Submitting Exercises

Note that, when trying to submit an exercise, make sure the solution is in the `$EXERCISM_WORKSPACE/nim/word-count` directory.

You can find your Exercism workspace by running `exercism debug` and looking for the line that starts with `Exercises Directory`.

For more detailed information about running tests, code style and linting,
please see the [help page](http://exercism.io/languages/nim).

## Source

This is a classic toy problem, but we were reminded of it by seeing it in the Go Tour.

## Submitting Incomplete Solutions

It's possible to submit an incomplete solution so you can see how others have completed the exercise.
