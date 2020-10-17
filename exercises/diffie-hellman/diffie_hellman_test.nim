import unittest, intsets
import diffie_hellman

suite "Diffie Hellman":
  test "private key is greater than 1 and less than p":
    const primes = [5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
    for p in primes:
      let a = privateKey(p)
      check a > 1 and a < p

  test "private key is random":
    # A correct implementation has a tiny chance of failing this test.
    let p = int.high
    var privateKeys = initIntSet()
    const n = 100
    for i in 1..n:
      privateKeys.incl(privateKey(p))
    check privateKeys.len == n

  test "can calculate public key using private key":
    const p = 23
    const g = 5
    const privateKey = 6
    check publicKey(p, g, privateKey) == 8

  test "can calculate secret using other party's public key":
    const p = 23
    const theirPublicKey = 19
    const myPrivateKey = 6
    check secret(p, theirPublicKey, myPrivateKey) == 2

  test "key exchange":
    # Nim does not support big integers in the standard library.
    # To demonstrate key exchange, p is a small prime for this test.
    # It must be a large prime for security in the real world.
    const p = 7
    const g = 3
    let alicePrivateKey = privateKey(p)
    let bobPrivateKey = privateKey(p)
    let alicePublicKey = publicKey(p, g, alicePrivateKey)
    let bobPublicKey = publicKey(p, g, bobPrivateKey)
    let secretA = secret(p, bobPublicKey, alicePrivateKey)
    let secretB = secret(p, alicePublicKey, bobPrivateKey)
    check secretA == secretB
