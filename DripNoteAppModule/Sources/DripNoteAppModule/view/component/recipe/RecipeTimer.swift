import SwiftUI

enum RecipeTimerState {
    case waiting(total: Second)
    case running(total: Second, current: Second)
    case complete

    func getProgress() -> Double {
        return switch self {
        case .waiting: 0.0
        case let .running(total, current): Double(current.value) / Double(total.value)
        case .complete: 1.0
        }
    }
}

struct RecipeTimer: View {
    private static let barWidth: CGFloat = 8.0

    let state: RecipeTimerState
    let size: CGFloat

    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(
                    Color.themeNavyDark,
                    lineWidth: Self.barWidth
                )
                .frame(width: size, height: size)
            Circle()
                .trim(from: 0.0, to: state.getProgress())
                .stroke(
                    Color.themeGray,
                    lineWidth: Self.barWidth
                )
                .frame(width: size, height: size)
                .rotationEffect(.degrees(-90))

            switch state {
            case let .running(total, current):
                Text(String(total.value - current.value))
                    .font(.system(size: 16.0))
                    .foregroundStyle(Color.grayText)
                    .fontWeight(.bold)
            case let .waiting(seconds):
                Text(String(seconds.value))
                    .font(.system(size: 16.0))
                    .foregroundStyle(Color.grayText)
                    .fontWeight(.bold)
            case .complete:
                // TODO: Show checkmark.
                EmptyView()
            }
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    VStack(spacing: 16.0) {
        RecipeTimer(state: .running(total: Second(20), current: Second(0)),
                    size: 64.0)
        RecipeTimer(state: .running(total: Second(20), current: Second(4)),
                    size: 64.0)
        RecipeTimer(state: .running(total: Second(20), current: Second(16)),
                    size: 64.0)
        RecipeTimer(state: .running(total: Second(20), current: Second(20)),
                    size: 64.0)
    }
}
