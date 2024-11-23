import Foundation

enum RecipeConverter {
    // TODO: Consider the progress.
    static func toRecipeCardStates(recipe: Recipe) -> [RecipeCardState] {
        var totalWeight = 0
        return recipe.steps.enumerated().map { pair in
            let (index, recipeStep) = pair
            switch recipeStep {
            case let .drip(water, seconds):
                totalWeight += water.value
                return if totalWeight == water.value {
                    RecipeCardState.waiting(
                        index: index,
                        text: RecipeLabels.stepPour(water: water, seconds: seconds),
                        timerTotal: seconds
                    )
                } else {
                    RecipeCardState.waiting(
                        index: index,
                        text: RecipeLabels.stepPour(
                            until: Gram(totalWeight + water.value),
                            water: water,
                            seconds: seconds
                        ),
                        timerTotal: seconds
                    )
                }
            case let .wait(seconds):
                return RecipeCardState.waiting(
                    index: index,
                    text: RecipeLabels.stepWait(seconds: seconds),
                    timerTotal: seconds
                )
            case .waitUntilDripped:
                return RecipeCardState.waiting(
                    index: index,
                    text: RecipeLabels.stepWaitUntilEnd(),
                    // TODO: Add Second.infinity.
                    timerTotal: Second(0)
                )
            }
        }
    }
}
