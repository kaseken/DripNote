import SwiftUI

enum NavigationPath: Hashable {
    case recipeList
}

public struct RootView: View {
    @State private var path: [NavigationPath] = []

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            VStack {
                RecipeScreen(onMenuTapped: { path.append(.recipeList) })
                Spacer()
            }
        }
        .navigationDestination(for: NavigationPath.self) { _ in
            RecipeListScreen()
        }
    }
}
