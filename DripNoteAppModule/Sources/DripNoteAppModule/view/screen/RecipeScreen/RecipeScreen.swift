import SwiftUI

struct RecipeScreen: View {
    @StateObject private var viewModel: RecipeScreenViewModel

    private let onMenuTapped: () -> Void

    init(onMenuTapped: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: RecipeScreenViewModel())
        self.onMenuTapped = onMenuTapped
    }

    var body: some View {
        NavigationView {
            switch viewModel.uiState {
            case .loading:
                // TODO: Move to loading screen.
                ProgressView()
            case let .idle(recipe):
                IdleRecipeScreen(
                    recipe: recipe,
                    onStartTapped: viewModel.onStartTapped,
                    onMenuTapped: onMenuTapped,
                    // TODO: Open settings.
                    onSettingsTapped: {}
                )
            case let .running(recipe, elapsedTime):
                RunningRecipeScreen(
                    recipe: recipe,
                    elapsedTime: elapsedTime,
                    onAbortTapped: viewModel.onAbortTapped,
                    onFinishTapped: viewModel.onFinishTapped
                )
            case .finished:
                FinishedRecipeScreen(onBackTapped: viewModel.onBackTapped)
            }
        }
    }
}
