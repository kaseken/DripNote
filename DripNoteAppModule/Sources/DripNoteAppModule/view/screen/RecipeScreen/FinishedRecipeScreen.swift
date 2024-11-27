import SwiftUI

struct FinishedRecipeScreen: View {
    let onBackTapped: () -> Void

    var body: some View {
        VStack {
            Text(
                String(
                    localized: "finish_screen_message",
                    bundle: Bundle.module
                )
            )
            .font(.system(size: 20, weight: .bold))
            .lineSpacing(8.0)
            .foregroundStyle(DNColor.grayText)
            .multilineTextAlignment(.center)
            Image("CoffeeIcon", bundle: .module)
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(DNColor.grayText)
                .padding(.top, 24.0)
                .padding(.bottom, 64.0)
            TextButton(
                label: String(localized: "button_back", bundle: Bundle.module),
                style: .secondary,
                action: onBackTapped
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DNColor.backgroundBeige)
    }
}

#Preview {
    FinishedRecipeScreen(onBackTapped: {})
}
