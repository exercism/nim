# Diffie Hellman

Diffie-Hellman key exchange.

Alice and Bob use Diffie-Hellman key exchange to share secrets.  They
start with prime numbers, pick private keys, generate and share public
keys, and then generate a shared secret key.

## Step 0

The test program supplies prime numbers p and g.

## Step 1

Alice picks a private key, a, greater than 1 and less than p.  Bob does
the same to pick a private key b.

## Step 2

Alice calculates a public key A.

    A = g**a mod p

Using the same p and g, Bob similarly calculates a public key B from his
private key b.

## Step 3

Alice and Bob exchange public keys.  Alice calculates secret key s.

    s = B**a mod p

Bob calculates

    s = A**b mod p

The calculations produce the same result!  Alice and Bob now share
secret s.

## Running the tests

To compile and run the tests, just run the following in your exercise directory:
```bash
$ nim c -r diffie_hellman_test.nim
```

## Submitting Exercises

Note that, when trying to submit an exercise, make sure the solution is in the `$EXERCISM_WORKSPACE/nim/diffie-hellman` directory.

You can find your Exercism workspace by running `exercism debug` and looking for the line that starts with `Exercises Directory`.

## Need help?

These guides should help you,
* [Installing Nim](https://exercism.io/tracks/nim/installation)
* [Running the Tests](https://exercism.io/tracks/nim/tests)
* [Learning Nim](https://exercism.io/tracks/nim/learning)
* [Useful Nim Resources](https://exercism.io/tracks/nim/resources)


## Source

Wikipedia, 1024 bit key from www.cryptopp.com/wiki. [http://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange](http://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange)

## Submitting Incomplete Solutions

It's possible to submit an incomplete solution so you can see how others have completed the exercise.
