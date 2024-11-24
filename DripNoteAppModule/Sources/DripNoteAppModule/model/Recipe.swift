import Foundation

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
    case drip(water: Gram, seconds: Second)
    case wait(for: Second)
    case waitUntilDripped(atLeast: Second)

    var duration: Second {
        return switch self {
        case let .drip(_, seconds): seconds
        case let .wait(seconds): seconds
        case let .waitUntilDripped(seconds): seconds
        }
    }
}

let kDefaultRecipe = Recipe(
    id: "1",
    name: "DripNote's Recipe",
    miscellaneous: "",
    beanWeight: Gram(13),
    steps: [
        .drip(water: Gram(40), seconds: Second(20)),
        .wait(for: Second(20)),
        .drip(water: Gram(60), seconds: Second(20)),
        .wait(for: Second(15)),
        .drip(water: Gram(50), seconds: Second(20)),
        .wait(for: Second(15)),
        .drip(water: Gram(50), seconds: Second(20)),
        .waitUntilDripped(atLeast: Second(20)),
    ],
    // Sunday, November 17, 2024 8:32:50 AM
    updatedAt: Date(timeIntervalSince1970: 1_731_832_370),
    createdAt: Date(timeIntervalSince1970: 1_731_832_370)
)
