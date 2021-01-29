# Kindergarten Garden

Given a diagram, determine which plants each child in the kindergarten class is
responsible for.

The kindergarten class is learning about growing plants. The teacher
thought it would be a good idea to give them actual seeds, plant them in
actual dirt, and grow actual plants.

They've chosen to grow grass, clover, radishes, and violets.

To this end, the children have put little cups along the window sills, and
planted one type of plant in each cup, choosing randomly from the available
types of seeds.

```text
[window][window][window]
........................ # each dot represents a cup
........................
```

There are 12 children in the class:

- Alice, Bob, Charlie, David,
- Eve, Fred, Ginny, Harriet,
- Ileana, Joseph, Kincaid, and Larry.

Each child gets 4 cups, two on each row. Their teacher assigns cups to
the children alphabetically by their names.

The following diagram represents Alice's plants:

```text
[window][window][window]
VR......................
RG......................
```

In the first row, nearest the windows, she has a violet and a radish.  In the
second row she has a radish and some grass.

Your program will be given the plants from left-to-right starting with
the row nearest the windows. From this, it should be able to determine
which plants belong to each student.

For example, if it's told that the garden looks like so:

```text
[window][window][window]
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
```

Then if asked for Alice's plants, it should provide:

- Violets, radishes, violets, radishes

While asking for Bob's plants would yield:

- Clover, grass, clover, clover

## Running the tests

To compile and run the tests, just run the following in your exercise directory:
```bash
$ nim c -r test_kindergarten_garden.nim
```

## Submitting Exercises

Note that, when trying to submit an exercise, make sure the solution is in the `$EXERCISM_WORKSPACE/nim/kindergarten-garden` directory.

You can find your Exercism workspace by running `exercism debug` and looking for the line that starts with `Exercises Directory`.

## Need help?

These guides should help you,
* [Installing Nim](https://exercism.io/tracks/nim/installation)
* [Running the Tests](https://exercism.io/tracks/nim/tests)
* [Learning Nim](https://exercism.io/tracks/nim/learning)
* [Useful Nim Resources](https://exercism.io/tracks/nim/resources)


## Source

Random musings during airplane trip. [http://jumpstartlab.com](http://jumpstartlab.com)

## Submitting Incomplete Solutions

It's possible to submit an incomplete solution so you can see how others have completed the exercise.
