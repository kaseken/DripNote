import SwiftUI

struct Header<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        HStack {
            content
        }
        .frame(height: 48.0)
        .frame(maxWidth: .infinity)
        .background(Color.backgroundColor)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.themeGray),
            alignment: .bottom
        )
    }
}

#Preview("Empty Header") {
    Header {}
}

#Preview("Header with Buttons") {
    Header {
        Spacer().frame(width: 16.0)
        Button(action: {}) {
            Image(systemName: "list.dash")
                .font(.system(size: 24.0))
                .foregroundStyle(Color.themeGrayDark)
        }
        Spacer()
        Button(action: {}) {
            Image(systemName: "gearshape")
                .font(.system(size: 24.0))
                .foregroundStyle(Color.themeGrayDark)
        }
        Spacer().frame(width: 16.0)
    }
}
