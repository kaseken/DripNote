import Foundation

struct Second {
    let value: Int
    init(_ value: Int) {
        self.value = value
    }

    static func + (lhs: Second, rhs: Second) -> Second {
        Second(lhs.value + rhs.value)
    }

    static func - (lhs: Second, rhs: Second) -> Second {
        Second(lhs.value - rhs.value)
    }
}
