import Foundation

enum RecipeConverter {
    static func toRecipeCardStates(recipe: Recipe, currentTime: Second) -> [RecipeCardState] {
        var totalWeight = 0
        var totalSeconds = 0
        let lastStepIndex = recipe.steps.count - 1
        return recipe.steps.enumerated().map { pair in
            let (index, recipeStep) = pair
            // Calculate current state for this step.
            let currentStepDuration = recipeStep.duration
            let currentStepElapsed = currentTime.value - totalSeconds
            let timerState: RecipeTimerState = if currentStepElapsed < 0 {
                .waiting(total: currentStepDuration)
            } else if currentStepDuration.value - currentStepElapsed > 0 {
                .running(total: currentStepDuration, current: Second(currentStepElapsed))
            } else {
                .complete
            }
            totalSeconds += currentStepDuration.value
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
                    timerState: timerState
                )
            case let .wait(seconds):
                return RecipeCardState(
                    index: index,
                    text: RecipeLabels.stepWait(seconds: seconds),
                    isLastStep: index == lastStepIndex,
                    timerState: timerState
                )
            case .waitUntilDripped:
                return RecipeCardState(
                    index: index,
                    text: RecipeLabels.stepWaitUntilEnd(),
                    isLastStep: index == lastStepIndex,
                    timerState: timerState
                )
            }
        }
    }
}
