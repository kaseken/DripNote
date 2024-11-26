import SwiftUI

enum TextButtonStyle {
    case primary
    case secondary
}

struct TextButton: View {
    let label: String
    let style: TextButtonStyle
    let action: (() -> Void)?

    private var textColor: SwiftUI.Color {
        if action == nil {
            return DNColor.white
        }
        return style == .primary ? DNColor.white : DNColor.themeNavyDark
    }

    private var backgroundColor: SwiftUI.Color {
        if action == nil {
            return DNColor.themeGrayLight
        }
        return style == .primary ? DNColor.themeNavyDark : DNColor.white
    }

    private var borderColor: SwiftUI.Color {
        if action == nil {
            return SwiftUI.Color.clear
        }
        return style == .primary ? SwiftUI.Color.clear : DNColor.themeNavyDark
    }

    var body: some View {
        Button(action: action ?? {}) {
            Text(label)
                .font(.headline)
                .foregroundColor(textColor)
                .padding(.vertical, 12.0)
                .padding(.horizontal, 36.0)
                .frame(minWidth: 160)
                .background(backgroundColor)
                .cornerRadius(16)
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(borderColor, lineWidth: 1)
                }
        }
        .disabled(action == nil)
    }
}

#Preview {
    TextButton(label: "ドリップ開始", style: .primary, action: {})
    TextButton(label: "ドリップ開始", style: .primary, action: nil)
    TextButton(label: "ドリップ終了", style: .secondary, action: {})
    TextButton(label: "ドリップ終了", style: .secondary, action: nil)
}
