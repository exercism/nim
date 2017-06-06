import strutils

proc encode*(plaintext: string): string =
  let 
    alpha_start = int('a')
    alpha_end = int('z')
  var 
    cipher = ""
    cipher_len = 0

  for c in plaintext:
    var d = c
    if isAlphaNumeric(d):
      if isAlphaAscii(d):
        if int(d) < alpha_start:
          d = toLowerAscii(d)

        d = char(int(d) + (alpha_end - int(d)) - (int(d) - alpha_start))

      if cipher_len != 0 and cipher_len mod 5 == 0:
        cipher.add(" " & d)
      else:
        cipher.add(d)

      inc(cipher_len)

  cipher
