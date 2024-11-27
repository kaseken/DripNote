import SwiftUI

struct IdleRecipeScreen: View {
    let recipe: Recipe
    let onStartTapped: () -> Void
    let onMenuTapped: () -> Void
    let onSettingsTapped: () -> Void

    @State private var isStartDialogOpen: Bool = false
    @State private var beanWeight: Gram? = nil

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Header {
                    HStack {
                        Spacer().frame(width: 16.0)
                        Button(action: onMenuTapped) {
                            Image(systemName: "list.dash")
                                .font(.system(size: 24.0))
                                .foregroundStyle(DNColor.themeGrayDark)
                        }
                        Spacer()
                        Button(action: onSettingsTapped) {
                            Image(systemName: "gearshape")
                                .font(.system(size: 24.0))
                                .foregroundStyle(DNColor.themeGrayDark)
                        }
                        Spacer().frame(width: 16.0)
                    }
                }
                ZStack(alignment: .bottomTrailing) {
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(
                                RecipeConverter.toRecipeCardStates(
                                    recipe: recipe,
                                    currentTime: Second(0)
                                )
                            ) { recipeCardState in
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
                    }
                    IconButton(
                        iconSystemName: "play.fill",
                        size: 72.0,
                        foregroundColor: DNColor.white,
                        backgroundColor: DNColor.themeNavyDark,
                        borderColor: nil,
                        onClick: onStartTapped
                    )
                    .shadow(radius: 8.0)
                    .padding(.all, 16.0)
                }
            }
            .background(DNColor.backgroundBeige)

            if isStartDialogOpen {
                ZStack {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                    VStack(alignment: .center, spacing: 16.0) {
                        HStack {
                            Button(action: {
                                isStartDialogOpen.toggle()
                            }) {
                                Image(systemName: "multiply")
                                    .font(.system(size: 24.0))
                                    .foregroundStyle(DNColor.themeGrayDark)
                            }
                        }
                        Text(String(localized: "choose_bean_weight", bundle: Bundle.module))
                            .foregroundStyle(DNColor.grayText)
                            .font(.system(size: 16.0, weight: .bold))

                        Picker(
                            "",
                            selection: Binding<Gram>(
                                get: { beanWeight ?? recipe.beanWeight },
                                set: { beanWeight = $0 }
                            )
                        ) {}
                    }
                    .background(DNColor.backgroundBeige)
                    .cornerRadius(16.0)
                }
            }
        }
    }
}

#Preview {
    IdleRecipeScreen(
        recipe: kDefaultRecipe,
        onStartTapped: {},
        onMenuTapped: {},
        onSettingsTapped: {}
    )
}
