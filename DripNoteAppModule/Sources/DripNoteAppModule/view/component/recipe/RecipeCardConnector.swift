import SwiftUI

struct RecipeCardConnector: View {
    let previousTimerState: RecipeTimerState

    var body: some View {
        let color = if case .complete = previousTimerState {
            DNColor.themeGray
        } else {
            DNColor.themeBeigeLight
        }
        Rectangle().foregroundStyle(color).frame(width: 12.0, height: 16.0)
    }
}
