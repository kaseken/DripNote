import Foundation

enum RecipeLabels {
    static func stepPour(water: Gram, seconds: Second) -> String {
        String(
            format: String(localized: "step_pour", bundle: Bundle.module),
            water.value,
            seconds.value
        )
    }

    static func stepWait(seconds: Second) -> String {
        String(
            format: String(localized: "step_wait", bundle: Bundle.module),
            seconds.value
        )
    }
}