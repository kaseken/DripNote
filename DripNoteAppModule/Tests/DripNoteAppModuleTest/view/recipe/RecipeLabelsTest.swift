@testable import DripNoteAppModule
import Testing

struct RecipeLabelsTest {
    @Test
    func stepPour() async throws {
        let result = RecipeLabels.stepPour(water: Gram(60), seconds: Second(20))
        #expect(result == "Pour 60g of hot water in 20 seconds.")
    }
}
