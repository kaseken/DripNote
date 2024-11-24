import SwiftUI

struct IdleRecipeScreen: View {
    let recipe: Recipe
    let onStartTapped: () -> Void
    let onMenuTapped: () -> Void
    let onSettingsTapped: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            Header {
                HStack {
                    Spacer().frame(width: 16.0)
                    Button(action: onMenuTapped) {
                        Image(systemName: "list.dash")
                            .font(.system(size: 24.0))
                            .foregroundStyle(Color.themeGrayDark)
                    }
                    Spacer()
                    Button(action: onSettingsTapped) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24.0))
                            .foregroundStyle(Color.themeGrayDark)
                    }
                    Spacer().frame(width: 16.0)
                }
            }
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(RecipeConverter.toRecipeCardStates(recipe: recipe)) { recipeCardState in
                            RecipeCard(state: recipeCardState)
                            if !recipeCardState.isLastStep {
                                HStack(alignment: .center) {
                                    Rectangle()
                                        .foregroundStyle(Color.themeBeigeLight)
                                        .frame(width: 16.0, height: 16.0)
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
                    foregroundColor: Color.white,
                    backgroundColor: Color.themeNavyDark,
                    borderColor: nil,
                    onClick: onStartTapped
                )
                .shadow(radius: 8.0)
                .padding(.all, 16.0)
            }
        }
        .background(Color.backgroundBeige)
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
