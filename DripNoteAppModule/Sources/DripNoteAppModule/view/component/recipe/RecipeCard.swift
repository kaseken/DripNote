import SwiftUI

struct RecipeCardData {
    let text: String
}

struct RecipeCard: View {
    let text: String
    let timerState: RecipeTimerState

    var body: some View {
        HStack(alignment: .center, spacing: 8.0) {
            RecipeTimer(state: timerState, size: 64.0).padding(16.0)
            // TODO: Define typography.
            Text(text)
                .font(.system(size: 16.0))
                .fontWeight(.regular)
                .foregroundStyle(Color.grayText)
                .lineSpacing(4.0)
            Spacer()
        }
        .frame(minHeight: 96)
        .frame(width: .infinity)
        .background(Color.backgroundWhite)
        .cornerRadius(8.0)
    }
}

struct RecipeCardConnector: View {
    let color: SwiftUI.Color
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width, height: height)
    }
}

#Preview {
    VStack(spacing: 0) {
        Spacer()
        RecipeCard(
            text: "20秒間かけて\n湯を40g注ぎましょう",
            timerState: .complete
        )
        .padding(.horizontal, 16.0)
        RecipeCardConnector(
            color: Color.themeBeigeLight,
            width: 12.0,
            height: 16.0
        )
        RecipeCard(
            text: "20秒間待ちましょう",
            timerState: .running(seconds: Second(16), progress: 4.0 / 20.0)
        )
        .padding(.horizontal, 16.0)
        RecipeCardConnector(
            color: Color.themeBeigeLight,
            width: 12.0,
            height: 16.0
        )
        RecipeCard(
            text: "全量が100gになるまで\n20秒間かけて\n湯を60g注ぎましょう",
            timerState: .waiting(seconds: Second(20))
        )
        .padding(.horizontal, 16.0)
        Spacer()
    }
    .background(Color.backgroundBeige)
}
