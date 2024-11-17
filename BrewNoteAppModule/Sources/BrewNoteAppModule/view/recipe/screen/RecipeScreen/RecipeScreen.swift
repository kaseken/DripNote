import SwiftUI

struct RecipeScreen: View {
    let onMenuTapped: () -> Void

    var body: some View {
        NavigationView {
            VStack {
                Header {
                    HStack {
                        Spacer().frame(width: 16.0)
                        Button(action: onMenuTapped) {
                            Image(systemName: "list.dash")
                                .font(.system(size: 24.0))
                                .foregroundStyle(Color.themeGrayDark)
                        }
                        Spacer()
                        // TODO: Open settings.
                        Button(action: {}) {
                            Image(systemName: "gearshape")
                                .font(.system(size: 24.0))
                                .foregroundStyle(Color.themeGrayDark)
                        }
                        Spacer().frame(width: 16.0)
                    }
                }
                ScrollView {
                    Text("RecipeScreen")
                }
            }
            .background(Color.backgroundBeige)
        }
    }
}

#Preview {
    RecipeScreen(
        onMenuTapped: {}
    )
}
