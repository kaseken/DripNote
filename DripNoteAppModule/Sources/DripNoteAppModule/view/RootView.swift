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
                Color.backgroundBeige.edgesIgnoringSafeArea(.all)
                VStack {
                    RecipeScreen(onMenuTapped: { path.append(.recipeList) })
                    Spacer()
                }
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
