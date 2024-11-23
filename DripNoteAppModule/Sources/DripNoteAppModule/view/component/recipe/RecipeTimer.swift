import SwiftUI

enum RecipeTimerState {
    case waiting(seconds: Second)
    case running(seconds: Second, progress: Double)
    case complete

    func getProgress() -> Double {
        return switch self {
        case .waiting: 0.0
        case let .running(_, progress): progress
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
            case let .running(seconds, _):
                Text(String(seconds.value))
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
        RecipeTimer(state: .running(seconds: Second(20), progress: 0.0),
                    size: 64.0)
        RecipeTimer(state: .running(seconds: Second(20), progress: 0.2),
                    size: 64.0)
        RecipeTimer(state: .running(seconds: Second(20), progress: 0.7),
                    size: 64.0)
        RecipeTimer(state: .running(seconds: Second(20), progress: 1.0),
                    size: 64.0)
    }
}
