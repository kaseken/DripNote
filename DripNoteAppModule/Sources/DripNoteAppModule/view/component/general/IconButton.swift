import SwiftUI

struct IconButton: View {
    let iconSystemName: String
    let size: CGFloat
    let foregroundColor: SwiftUI.Color
    let backgroundColor: SwiftUI.Color
    let borderColor: SwiftUI.Color?
    let onClick: () -> Void

    var body: some View {
        Button(action: onClick) {
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
            foregroundColor: DNColor.white,
            backgroundColor: DNColor.themeNavyDark,
            borderColor: nil,
            onClick: {}
        )
        IconButton(
            iconSystemName: "plus",
            size: 72.0,
            foregroundColor: DNColor.themeNavyDark,
            backgroundColor: DNColor.white,
            borderColor: DNColor.themeNavyDark,
            onClick: {}
        )
    }
}
