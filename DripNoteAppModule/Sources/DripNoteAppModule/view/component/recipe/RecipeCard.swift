import SwiftUI

enum RecipeCardState: Identifiable {
    case waiting(index: Int, text: String, timerTotal: Second)
    case running(index: Int, text: String, timerCurrent: Second, timerTotal: Second)
    case complete(index: Int, text: String)

    var id: String {
        switch self {
        case let .waiting(index, _, _): String("waiting_\(index)")
        case let .running(index, _, current, _): String("running_\(index)_\(current.value)")
        case let .complete(index, _): String("complete_\(index)")
        }
    }

    var timerState: RecipeTimerState {
        return switch self {
        case let .waiting(_, _, total):
            .waiting(seconds: total)
        case let .running(_, _, current, total):
            .running(
                seconds: current,
                progress: Double(total.value - current.value) / Double(total.value)
            )
        case .complete: .complete
        }
    }

    var text: String {
        return switch self {
        case let .waiting(_, text, _): text
        case let .running(_, text, _, _): text
        case let .complete(_, text): text
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
            state: .complete(index: 0, text: "20秒間かけて\n湯を40g注ぎましょう")
        )
        .padding(.horizontal, 16.0)
        RecipeCardConnector(
            color: Color.themeBeigeLight,
            width: 12.0,
            height: 16.0
        )
        RecipeCard(
            state: .running(
                index: 1,
                text: "20秒間待ちましょう",
                timerCurrent: Second(16),
                timerTotal: Second(20)
            )
        )
        .padding(.horizontal, 16.0)
        RecipeCardConnector(
            color: Color.themeBeigeLight,
            width: 12.0,
            height: 16.0
        )
        RecipeCard(
            state: .waiting(
                index: 2,
                text: "全量が100gになるまで\n20秒間かけて\n湯を60g注ぎましょう",
                timerTotal: Second(20)
            )
        )
        .padding(.horizontal, 16.0)
        Spacer()
    }
    .background(Color.backgroundBeige)
}
