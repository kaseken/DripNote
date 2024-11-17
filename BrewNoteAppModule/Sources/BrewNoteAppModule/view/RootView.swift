import SwiftUI

enum NavigationPath: Hashable {
    case recipeList
}

public struct RootView: View {
    @State private var path: [NavigationPath] = []

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            RecipeScreen(onMenuTapped: { path.append(.recipeList) })
        }
        .navigationDestination(for: NavigationPath.self) { destination in
            switch destination {
            case .recipeList:
                RecipeListScreen()
            }
        }
    }
}
