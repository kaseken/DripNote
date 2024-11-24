import Foundation

enum RecipeLabels {
    static func stepPour(water: Gram, seconds: Second) -> String {
        String(
            format: String(localized: "step_pour", bundle: Bundle.module, locale: Locale.current),
            water.value,
            seconds.value
        )
    }

    static func stepPour(until: Gram, water: Gram, seconds: Second) -> String {
        String(
            format: String(localized: "step_pour_until", bundle: Bundle.module, locale: Locale.current),
            water.value,
            seconds.value,
            until.value
        )
    }

    static func stepWait(seconds: Second) -> String {
        String(
            format: String(localized: "step_wait", bundle: Bundle.module, locale: Locale.current),
            seconds.value
        )
    }

    static func stepWaitUntilEnd() -> String {
        String(format: String(localized: "step_wait_until_end", bundle: Bundle.module, locale: Locale.current))
    }
}
