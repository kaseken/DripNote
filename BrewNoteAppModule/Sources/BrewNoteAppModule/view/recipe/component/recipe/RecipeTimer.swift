import SwiftUI

struct RecipeTimer: View {
    let text: String
    let size: CGFloat

    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(Color.themeGray, lineWidth: 8.0)
                .frame(width: size, height: size)
            // TODO: Define typography.
            Text(text)
                .foregroundStyle(Color.grayText)
                .fontWeight(.bold)
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    RecipeTimer(text: "20", size: 64.0)
}
