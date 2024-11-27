import SwiftUI

struct IdleRecipeScreen: View {
    let recipe: Recipe
    let onStartTapped: (Gram) -> Void
    let onMenuTapped: () -> Void
    let onSettingsTapped: () -> Void

    @State private var isStartDialogOpen: Bool = false
    @State private var chosenBeanWeight: Int? = nil

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
                        onClick: { isStartDialogOpen = true }
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
                    VStack(alignment: .center, spacing: 24.0) {
                        HStack {
                            Spacer()
                            Button(action: { isStartDialogOpen = false }) {
                                Image(systemName: "multiply")
                                    .font(.system(size: 24.0))
                                    .foregroundStyle(DNColor.themeGrayDark)
                            }
                            Spacer().frame(width: 8.0)
                        }
                        .padding(.top, 8.0)
                        Text(String(localized: "choose_bean_weight", bundle: Bundle.module))
                            .foregroundStyle(DNColor.grayText)
                            .font(.system(size: 16.0, weight: .bold))

                        Menu {
                            // TODO: Make min/max bean weight configurable.
                            ForEach((10 ..< 31).reversed(), id: \.self) { value in
                                Button(action: {
                                    chosenBeanWeight = value
                                }) {
                                    Text("\(value) g")
                                        .font(.system(size: 16.0, weight: .bold))
                                        .foregroundStyle(DNColor.blackText)
                                }
                            }
                        } label: {
                            Text("\(chosenBeanWeight ?? recipe.beanWeight.value) g")
                                .font(.system(size: 16.0, weight: .bold))
                                .foregroundStyle(DNColor.blackText)
                                .padding(.horizontal, 32.0)
                                .padding(.vertical, 16.0)
                                .background(DNColor.backgroundWhite)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8.0)
                                        .stroke(DNColor.grayText, lineWidth: 1.0)
                                }
                                .cornerRadius(8.0)
                        }

                        TextButton(
                            label: String(localized: "start_drip", bundle: Bundle.module),
                            style: .primary,
                            action: {
                                onStartTapped(Gram(chosenBeanWeight ?? recipe.beanWeight.value))
                            }
                        )
                        .padding(.bottom, 32.0)
                    }
                    .background(DNColor.backgroundBeige)
                    .cornerRadius(16.0)
                    .padding(.all, 32.0)
                }
            }
        }
    }
}

#Preview {
    IdleRecipeScreen(
        recipe: kDefaultRecipe,
        onStartTapped: { _ in },
        onMenuTapped: {},
        onSettingsTapped: {}
    )
}
