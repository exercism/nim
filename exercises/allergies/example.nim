import sequtils

type
    Allergies* = object
        score*: int

var
    allergiesList = [
        "eggs",
        "peanuts",
        "shellfish",
        "strawberries",
        "tomatoes",
        "chocolate",
        "pollen",
        "cats"
    ]


proc isAllergicTo*(allergies: Allergies, allergy: string): bool =
    (allergies.score and 1 shl allergiesList.find(allergy)) != 0

proc lst*(allergies: Allergies): seq[string] =
    allergiesList.filterIt(allergies.isAllergicTo(it))
