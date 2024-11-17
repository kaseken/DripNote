import SwiftUI

enum NavigationDestination {
    case recipeList
}

public struct RootView: View {
    @State private var path = NavigationPath()

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            RecipeScreen()
        }
        .navigationDestination(for: NavigationDestination.self) { destination in
            switch destination {
            case .recipeList:
                RecipeListScreen()
            }
        }
    }
}
