import SwiftUI

struct RecipeCardState: Identifiable {
    let index: Int
    let text: String
    let isLastStep: Bool
    let timerState: RecipeTimerState

    var id: String {
        switch timerState {
        case .waiting: String("waiting_\(index)")
        case let .running(_, current): String("running_\(index)_\(current.value)")
        case .complete: String("complete_\(index)")
        }
    }
}

struct RecipeCard: View {
    let state: RecipeCardState

    var body: some View {
        HStack(alignment: .center, spacing: 8.0) {
            RecipeTimer(state: state.timerState, size: 64.0).padding(16.0)
            // TODO: Define typography.
            Text(state.text)
                .font(.system(size: 16.0))
                .fontWeight(.regular)
                .foregroundStyle(Color.grayText)
                .lineSpacing(4.0)
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 96)
        .background(Color.backgroundWhite)
        .cornerRadius(8.0)
    }
}

#Preview {
    VStack(spacing: 0) {
        Spacer()
        RecipeCard(
            state: RecipeCardState(
                index: 0,
                text: "20秒間かけて\n湯を40g注ぎましょう",
                isLastStep: false,
                timerState: .complete
            )
        )
        .padding(.horizontal, 16.0)
        RecipeCardConnector(previousTimerState: .complete)
        RecipeCard(
            state: RecipeCardState(
                index: 1,
                text: "20秒間待ちましょう",
                isLastStep: false,
                timerState: .running(total: Second(20), current: Second(16))
            )
        )
        .padding(.horizontal, 16.0)
        RecipeCardConnector(
            previousTimerState: .running(total: Second(20), current: Second(16))
        )
        RecipeCard(
            state: RecipeCardState(
                index: 2,
                text: "全量が100gになるまで\n20秒間かけて\n湯を60g注ぎましょう",
                isLastStep: true,
                timerState: .waiting(total: Second(20))
            )
        )
        .padding(.horizontal, 16.0)
        Spacer()
    }
    .background(Color.backgroundBeige)
}
