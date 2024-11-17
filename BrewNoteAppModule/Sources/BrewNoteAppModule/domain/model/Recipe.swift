import Foundation

struct Gram {
    let value: Int
}

struct Second {
    let value: Int
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

struct RecipeStep {
    let recipeId: String
    let order: Int
    let content: RecipeStepContent
}

enum RecipeStepContent {
    case drip(waterWeight: Gram, timeSeconds: Second)
    case waitFor(time: Second)
    case waitUntilDripped
}
