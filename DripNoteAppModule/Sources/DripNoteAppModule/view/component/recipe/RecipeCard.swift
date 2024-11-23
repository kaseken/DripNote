import SwiftUI

enum RecipeCardState {
    case waiting(text: String, timerTotal: Second)
    case running(text: String, timerCurrent: Second, timerTotal: Second)
    case complete(text: String)

    var timerState: RecipeTimerState {
        return switch self {
        case let .waiting(_, total):
            .waiting(seconds: total)
        case let .running(_, current, total):
            .running(seconds: current,
                     progress: Double(total.value - current.value) / Double(total.value))
        case .complete: .complete
        }
    }

    var text: String {
        return switch self {
        case let .waiting(text, _): text
        case let .running(text, _, _): text
        case let .complete(text): text
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
            state: .complete(text: "20秒間かけて\n湯を40g注ぎましょう")
        )
        .padding(.horizontal, 16.0)
        RecipeCardConnector(
            color: Color.themeBeigeLight,
            width: 12.0,
            height: 16.0
        )
        RecipeCard(
            state: .running(
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
                text: "全量が100gになるまで\n20秒間かけて\n湯を60g注ぎましょう",
                timerTotal: Second(20)
            )
        )
        .padding(.horizontal, 16.0)
        Spacer()
    }
    .background(Color.backgroundBeige)
}
