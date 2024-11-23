import Foundation

struct RecipeConverter {
    // TODO: Consider the progress.
    func toRecipeCardStates(recipe: Recipe) -> [RecipeCardState] {
        var totalWeight = 0
        return recipe.steps.map { recipeStep in
            switch recipeStep {
            case let .drip(water, seconds):
                totalWeight += water.value
                return if totalWeight == water.value {
                    RecipeCardState.waiting(
                        text: RecipeLabels.stepPour(water: water, seconds: seconds),
                        timerTotal: seconds
                    )
                } else {
                    RecipeCardState.waiting(
                        text: RecipeLabels.stepPour(until: Gram(totalWeight + water.value),
                                                    water: water,
                                                    seconds: seconds),
                        timerTotal: seconds
                    )
                }
            case let .wait(seconds):
                return RecipeCardState.waiting(
                    text: RecipeLabels.stepWait(seconds: seconds),
                    timerTotal: seconds
                )
            case .waitUntilDripped:
                return RecipeCardState.waiting(
                    text: RecipeLabels.stepWaitUntilEnd(),
                    // TODO: Add Second.infinity.
                    timerTotal: Second(0)
                )
            }
        }
    }
}
