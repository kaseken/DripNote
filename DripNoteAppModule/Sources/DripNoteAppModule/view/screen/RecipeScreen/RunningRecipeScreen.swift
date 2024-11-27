import SwiftUI

struct RunningRecipeScreen: View {
    private static let finishButtonId = "FINISH_BUTTON"
    let recipe: Recipe
    let elapsedTime: Second
    let onAbortTapped: () -> Void
    let onFinishTapped: () -> Void

    var body: some View {
        let recipeCardStates = RecipeConverter.toRecipeCardStates(
            recipe: recipe,
            currentTime: elapsedTime
        )
        let currentIndex = recipeCardStates.first(
            where: {
                switch $0.timerState {
                case .running, .waiting: true
                case .complete: false
                }
            })?.index
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
            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(recipeCardStates) { recipeCardState in
                            RecipeCard(state: recipeCardState)
                                // TODO: Set id for scrolling.
                                .id(recipeCardState.index)
                            if !recipeCardState.isLastStep {
                                HStack(alignment: .center) {
                                    RecipeCardConnector(
                                        previousTimerState: recipeCardState.timerState
                                    )
                                }
                            }
                        }

                        TextButton(
                            label: String(localized: "finish_drip", bundle: Bundle.module),
                            style: .secondary,
                            // Active if all of the steps are completed.
                            action: currentIndex == nil ? onFinishTapped : nil
                        )
                        .id(recipeCardStates.count)
                        .padding(.vertical, 64.0)
                    }
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 16.0)
                }
                .scrollDisabled(true)
                .onChange(of: currentIndex) {
                    withAnimation {
                        if let currentIndex {
                            scrollViewProxy.scrollTo(currentIndex, anchor: .center)
                        }
                    }
                }
            }
        }
        .background(Color.backgroundBeige)
    }
}

#Preview {
    RunningRecipeScreen(
        recipe: kDefaultRecipe,
        elapsedTime: Second(81),
        onAbortTapped: {},
        onFinishTapped: {}
    )
}
