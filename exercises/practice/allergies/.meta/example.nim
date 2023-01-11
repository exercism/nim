type
  Allergen* = enum
    Eggs
    Peanuts
    Shellfish
    Strawberries
    Tomatoes
    Chocolate
    Pollen
    Cats

func isAllergicTo*(score: int, allergen: Allergen): bool =
  (score and 1 shl allergen.ord) != 0

func allergies*(score: int): set[Allergen] =
  cast[typeof(result)](score)
