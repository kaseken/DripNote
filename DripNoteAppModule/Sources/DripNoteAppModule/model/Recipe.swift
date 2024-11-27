import Foundation

struct Recipe {
    let id: String
    let name: String
    let beanWeight: Gram
    let steps: [RecipeStep]
    let updatedAt: Date
    let createdAt: Date

    // Returns the same recipe for different bean weight.
    // The time will be identical whereas the water weight will be changed.
    func with(beanWeight: Gram) -> Recipe {
        assert(beanWeight.value > 0)
        if beanWeight == self.beanWeight { return self }
        let scale = Double(beanWeight.value) / Double(max(self.beanWeight.value, 1))
        return Recipe(
            id: id,
            name: name,
            beanWeight: beanWeight,
            steps: steps.map { $0.weightMultiplied(by: scale) },
            updatedAt: updatedAt,
            createdAt: createdAt
        )
    }
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

    func weightMultiplied(by scale: Double) -> RecipeStep {
        return switch self {
        case let .drip(water, _): .drip(water: water * scale, seconds: duration)
        case .wait: self
        case .waitUntilDripped: self
        }
    }
}

let kDefaultRecipe = Recipe(
    id: "1",
    name: "DripNote's Recipe",
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
