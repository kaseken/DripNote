import SwiftUI

struct IdleRecipeScreen: View {
    let recipe: Recipe
    let onMenuTapped: () -> Void

    var body: some View {
        VStack {
            Header {
                HStack {
                    Spacer().frame(width: 16.0)
                    Button(action: onMenuTapped) {
                        Image(systemName: "list.dash")
                            .font(.system(size: 24.0))
                            .foregroundStyle(Color.themeGrayDark)
                    }
                    Spacer()
                    // TODO: Open settings.
                    Button(action: {}) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24.0))
                            .foregroundStyle(Color.themeGrayDark)
                    }
                    Spacer().frame(width: 16.0)
                }
            }
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(RecipeConverter.toRecipeCardStates(recipe: recipe)) { recipeCardState in
                        RecipeCard(state: recipeCardState)
                    }
                }
                .padding(.horizontal, 16.0)
                .padding(.vertical, 16.0)
            }
        }
        .background(Color.backgroundBeige)
    }
}

#Preview {
    IdleRecipeScreen(
        recipe: kDefaultRecipe,
        onMenuTapped: {}
    )
}
