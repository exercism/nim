import strutils

const
    ascii_lowercase = {'a'..'z'}

proc isPangram*(sentence:string): bool =
    for c in ascii_lowercase:
        if c notin sentence.toLowerAscii: return false
    return true