import SwiftUI

struct RecipeScreen: View {
    let onMenuTapped: () -> Void

    var body: some View {
        VStack {
            Text("RecipeScreen")
            Button(action: onMenuTapped) {
                Text("OpenMenu")
            }
        }
    }
}

#Preview {
    RecipeScreen(
        onMenuTapped: {}
    )
}
