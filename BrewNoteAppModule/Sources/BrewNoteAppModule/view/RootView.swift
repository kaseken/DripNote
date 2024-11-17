import SwiftUI

enum NavigationPath: Hashable {
    case recipeList
}

public struct RootView: View {
    @State private var path: [NavigationPath] = []

    public init() {}

    public var body: some View {
        RecipeScreen(onMenuTapped: { path.append(.recipeList) })
    }
}
