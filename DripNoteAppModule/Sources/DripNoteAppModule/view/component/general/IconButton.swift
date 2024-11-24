import SwiftUI

struct IconButton: View {
    let iconSystemName: String
    let size: CGFloat
    let foregroundColor: SwiftUI.Color
    let backgroundColor: SwiftUI.Color
    let borderColor: SwiftUI.Color?

    var body: some View {
        Button(action: {}) {
            Image(systemName: iconSystemName)
                .font(.system(size: size / 2))
                .foregroundStyle(foregroundColor)
                .frame(width: size, height: size)
                .background(backgroundColor)
                .clipShape(Circle())
                .overlay(Circle().stroke(
                    self.borderColor ?? .clear,
                    lineWidth: self.borderColor != nil ? 1 : 0
                ))
        }
    }
}

#Preview {
    VStack(spacing: 24.0) {
        IconButton(
            iconSystemName: "play.fill",
            size: 72.0,
            foregroundColor: Color.white,
            backgroundColor: Color.themeNavyDark,
            borderColor: nil
        )
        IconButton(
            iconSystemName: "plus",
            size: 72.0,
            foregroundColor: Color.themeNavyDark,
            backgroundColor: Color.white,
            borderColor: Color.themeNavyDark
        )
    }
}
