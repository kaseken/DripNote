import SwiftUI

struct RecipeCard: View {
    let test: String
    let timerLabel: String
    let timerProgress: Double

    var body: some View {
        HStack(alignment: .center, spacing: 8.0) {
            RecipeTimer(
                text: timerLabel,
                size: 64.0,
                progress: timerProgress
            )
            .padding(16.0)
            // TODO: Define typography.
            Text(test)
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

#Preview {
    VStack(spacing: 16.0) {
        Spacer()
        RecipeCard(
            test: "20秒間かけて\n湯を40g注ぎましょう",
            timerLabel: "-",
            timerProgress: 20.0 / 20.0
        )
        .padding(.horizontal, 16.0)
        RecipeCard(
            test: "20秒間待ちましょう",
            timerLabel: "16",
            timerProgress: 4.0 / 20.0
        )
        .padding(.horizontal, 16.0)
        RecipeCard(
            test: "全量が100gになるまで\n20秒間かけて\n湯を60g注ぎましょう",
            timerLabel: "20",
            timerProgress: 0 / 20.0
        )
        .padding(.horizontal, 16.0)
        Spacer()
    }
    .background(Color.backgroundBeige)
}
