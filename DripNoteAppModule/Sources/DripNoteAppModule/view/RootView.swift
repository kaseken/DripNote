import SwiftUI

enum NavigationPath: Hashable {
    case recipeList
}

public struct RootView: View {
    @State private var path: [NavigationPath] = []

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                // Updates color of safe-area.
                DNColor.backgroundBeige.edgesIgnoringSafeArea(.all)
                RecipeScreen(onMenuTapped: { path.append(.recipeList) })
                    .edgesIgnoringSafeArea(.bottom)
                    .navigationDestination(for: NavigationPath.self) { path in
                        switch path {
                        case .recipeList:
                            RecipeListScreen(path: $path)
                        }
                    }
            }
        }
    }
}
