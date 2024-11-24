import SwiftUI

struct Color {
    private static func rgb(_ r: Int, _ g: Int, _ b: Int) -> SwiftUI.Color {
        return SwiftUI.Color(red: Double(r) / 255.0, green: Double(g) / 255.0, blue: Double(b) / 255.0)
    }

    // White
    static let white = SwiftUI.Color.white
    static let backgroundWhite = SwiftUI.Color.white
    static let backgroundBeige = Self.rgb(247, 246, 242) // #F7F6F2

    // Beige
    static let themeBeigeLight = Self.rgb(240, 229, 207) // #F0E5CF

    // Navy
    static let themeNavyDark = Self.rgb(75, 101, 135) // #4B6587

    // Gray
    static let themeGray = Self.rgb(200, 198, 198) // #C8C6C6
    static let themeGrayDark = Self.rgb(145, 142, 130) // #918E82

    // Text colors
    static let grayText = Self.rgb(102, 102, 102) // #666666
}
