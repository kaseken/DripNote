import Foundation

struct Gram {
    let value: Int
    init(_ value: Int) {
        self.value = value
    }
}

struct Second {
    let value: Int
    init(_ value: Int) {
        self.value = value
    }
}

struct Recipe {
    let id: String
    let name: String
    let miscellaneous: String
    let beanWeight: Gram
    let steps: [RecipeStep]
    let updatedAt: Date
    let createdAt: Date
}

enum RecipeStep {
    case drip(waterWeight: Gram, timeSeconds: Second)
    case wait(for: Second)
    case waitUntilDripped
}

let kDefaultRecipe = Recipe(
    id: "1",
    name: "DripNote's Recipe",
    miscellaneous: "",
    beanWeight: Gram(13),
    steps: [
        .drip(waterWeight: Gram(40), timeSeconds: Second(20)),
        .wait(for: Second(20)),
        .drip(waterWeight: Gram(60), timeSeconds: Second(20)),
        .wait(for: Second(15)),
        .drip(waterWeight: Gram(50), timeSeconds: Second(20)),
        .wait(for: Second(15)),
        .drip(waterWeight: Gram(50), timeSeconds: Second(20)),
        .waitUntilDripped,
    ],
    // Sunday, November 17, 2024 8:32:50 AM
    updatedAt: Date(timeIntervalSince1970: 1_731_832_370),
    createdAt: Date(timeIntervalSince1970: 1_731_832_370)
)
