import strutils

const
    ascii_lowercase = {'a'..'z'}

proc is_pangram*(sentence:string): bool =
    for c in ascii_lowercase:
        if c notin sentence.toLowerAscii: return false
    return true