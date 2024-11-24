import Foundation

enum RecipeScreenUIState {
    case loading
    case idle(recipe: Recipe)
    case running(recipe: Recipe, elapsedTime: Second)
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

    func onStartTapped() {
        guard case let .idle(recipe) = uiState else { return }
        // TODO: Start timer.
        uiState = .running(recipe: recipe, elapsedTime: Second(0))
    }

    func onAbortTapped() {
        guard case let .running(recipe, _) = uiState else { return }
        uiState = .idle(recipe: recipe)
    }
}
