import Combine
import Foundation

enum RecipeScreenUIState {
    case loading
    case idle(recipe: Recipe)
    case running(recipe: Recipe, elapsedTime: Second)
}

final class RecipeScreenViewModel: ObservableObject {
    private var elapsedTime: Second = .init(0)
    private var timer: AnyCancellable?

    @Published var uiState: RecipeScreenUIState = .loading

    init() {
        loadRecipe()
    }

    deinit {
        clearTimer()
    }

    private func clearTimer() {
        elapsedTime = Second(0)
        timer?.cancel()
        timer = nil
    }

    // TODO: Load recipe from DB.
    private func loadRecipe() {
        uiState = .idle(recipe: kDefaultRecipe)
    }

    func onStartTapped() {
        guard case let .idle(recipe) = uiState else { return }
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                elapsedTime = Second(min(elapsedTime.value + 1, Int.max))
                uiState = .running(recipe: recipe, elapsedTime: elapsedTime)
            }
        uiState = .running(recipe: recipe, elapsedTime: Second(0))
    }

    func onAbortTapped() {
        guard case let .running(recipe, _) = uiState else { return }
        clearTimer()
        uiState = .idle(recipe: recipe)
    }
}
