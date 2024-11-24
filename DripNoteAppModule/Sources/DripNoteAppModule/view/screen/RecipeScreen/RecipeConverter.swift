import Foundation

enum RecipeConverter {
    // TODO: Consider the progress.
    static func toRecipeCardStates(recipe: Recipe) -> [RecipeCardState] {
        var totalWeight = 0
        let lastStepIndex = recipe.steps.count - 1
        return recipe.steps.enumerated().map { pair in
            let (index, recipeStep) = pair
            switch recipeStep {
            case let .drip(water, seconds):
                totalWeight += water.value
                let text = if totalWeight == water.value {
                    RecipeLabels.stepPour(water: water, seconds: seconds)
                } else {
                    RecipeLabels.stepPour(
                        until: Gram(totalWeight + water.value),
                        water: water,
                        seconds: seconds
                    )
                }
                return RecipeCardState(
                    index: index,
                    text: text,
                    isLastStep: index == lastStepIndex,
                    // TODO: Set different state according to the current time.
                    timerState: .waiting(total: seconds)
                )
            case let .wait(seconds):
                return RecipeCardState(
                    index: index,
                    text: RecipeLabels.stepWait(seconds: seconds),
                    isLastStep: index == lastStepIndex,
                    timerState: .waiting(total: seconds)
                )
            case .waitUntilDripped:
                return RecipeCardState(
                    index: index,
                    text: RecipeLabels.stepWaitUntilEnd(),
                    isLastStep: index == lastStepIndex,
                    // TODO: Set time.
                    timerState: .waiting(total: Second(0))
                )
            }
        }
    }
}
