import SwiftUI

struct RecipeTimer: View {
    private static let barWidth: CGFloat = 8.0

    let text: String
    let size: CGFloat
    let progress: Double

    init(text: String,
         size: CGFloat,
         progress: Double = 1.0)
    {
        self.text = text
        self.size = size
        self.progress = min(max(progress, 0.0), 1.0)
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
                .trim(from: 0.0, to: progress)
                .stroke(
                    Color.themeGray,
                    lineWidth: Self.barWidth
                )
                .frame(width: size, height: size)
                .rotationEffect(.degrees(-90))
            // TODO: Define typography.
            Text(text)
                .font(.system(size: 16.0))
                .foregroundStyle(Color.grayText)
                .fontWeight(.bold)
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    VStack(spacing: 16.0) {
        RecipeTimer(text: "20", size: 64.0, progress: 0.0)
        RecipeTimer(text: "20", size: 64.0, progress: 0.2)
        RecipeTimer(text: "20", size: 64.0, progress: 0.8)
        RecipeTimer(text: "20", size: 64.0, progress: 1.0)
    }
}
