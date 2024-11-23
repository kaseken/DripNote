import Foundation

enum RecipeScreenUIState {
    case loading
    case idle(recipe: Recipe)
}

final class RecipeScreenViewModel: ObservableObject {
    @Published var uiState: RecipeScreenUIState = .loading

    init() {
        loadRecipe()
    }

    // TODO: Load recipe from DB.
    private func loadRecipe() {
        uiState = .idle(recipe: kDefaultRecipe)
    }
}
