import SwiftUI

struct RunningRecipeScreen: View {
    let recipe: Recipe
    let elapsedTime: Second
    let onAbortTapped: () -> Void

    var body: some View {
        let recipeCardStates = RecipeConverter.toRecipeCardStates(
            recipe: recipe,
            currentTime: elapsedTime
        )
        VStack(spacing: 0) {
            Header {
                HStack {
                    Spacer().frame(width: 16.0)
                    Button(action: onAbortTapped) {
                        Image(systemName: "multiply")
                            .font(.system(size: 24.0))
                            .foregroundStyle(Color.themeGrayDark)
                    }
                    Spacer()
                }
            }
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(recipeCardStates) { recipeCardState in
                        RecipeCard(state: recipeCardState)
                        if !recipeCardState.isLastStep {
                            HStack(alignment: .center) {
                                RecipeCardConnector(
                                    previousTimerState: recipeCardState.timerState
                                )
                            }
                        }
                    }
                }
                .padding(.horizontal, 16.0)
                .padding(.vertical, 16.0)

                // TODO: Put complete button.
            }
        }
        .background(Color.backgroundBeige)
    }
}

#Preview {
    RunningRecipeScreen(
        recipe: kDefaultRecipe,
        elapsedTime: Second(81),
        onAbortTapped: {}
    )
}
