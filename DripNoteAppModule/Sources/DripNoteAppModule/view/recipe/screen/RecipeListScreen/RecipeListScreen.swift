import SwiftUI

struct RecipeListScreen: View {
    @Binding var path: [NavigationPath]

    var body: some View {
        VStack {
            Header {
                HStack {
                    Spacer().frame(width: 16.0)
                    Button(action: {
                        path.removeLast()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24.0))
                            .foregroundStyle(Color.themeGrayDark)
                    }
                    Spacer()
                }
            }
            ScrollView {
                Text("RecipeListScreen")
            }
        }
        .background(Color.backgroundBeige)
        // Hide default back button.
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RecipeListScreen(path: Binding(get: { [] }, set: { _, _ in }))
}