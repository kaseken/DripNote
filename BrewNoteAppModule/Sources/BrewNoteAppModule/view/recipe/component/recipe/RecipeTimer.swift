import SwiftUI

struct RecipeTimer: View {
    private static let barWidth: CGFloat = 8.0

    let text: String
    let size: CGFloat
    let activeRatio: Double

    init(text: String,
         size: CGFloat,
         activeRatio: Double = 1.0)
    {
        self.text = text
        self.size = size
        self.activeRatio = activeRatio
    }

    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(
                    Color.themeNavyDark,
                    lineWidth: Self.barWidth
                )
                .frame(width: size, height: size)
            Circle()
                .trim(from: 0.0, to: activeRatio)
                .stroke(
                    Color.themeGray,
                    lineWidth: Self.barWidth
                )
                .frame(width: size, height: size)
                .rotationEffect(.degrees(-90))
            // TODO: Define typography.
            Text(text)
                .foregroundStyle(Color.grayText)
                .fontWeight(.bold)
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    VStack(spacing: 16.0) {
        RecipeTimer(text: "20", size: 64.0, activeRatio: 0.0)
        RecipeTimer(text: "20", size: 64.0, activeRatio: 0.2)
        RecipeTimer(text: "20", size: 64.0, activeRatio: 0.8)
        RecipeTimer(text: "20", size: 64.0, activeRatio: 1.0)
    }
}
