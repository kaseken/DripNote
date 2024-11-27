import Foundation

struct Gram {
    let value: Int

    init(_ value: Int) {
        self.value = value
    }

    static func == (lhs: Gram, rhs: Gram) -> Bool {
        lhs.value == rhs.value
    }

    static func + (lhs: Gram, rhs: Gram) -> Gram {
        Gram(lhs.value + rhs.value)
    }

    static func - (lhs: Gram, rhs: Gram) -> Gram {
        Gram(lhs.value - rhs.value)
    }

    static func * (lhs: Gram, rhs: Double) -> Gram {
        Gram(Int(ceil(Double(lhs.value) * rhs)))
    }
}
