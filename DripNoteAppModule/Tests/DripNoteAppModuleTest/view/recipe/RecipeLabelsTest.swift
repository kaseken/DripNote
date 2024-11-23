@testable import DripNoteAppModule
import Testing

struct RecipeLabelsTest {
    @Test
    func stepPour() async throws {
        #expect(RecipeLabels.stepPour(water: Gram(60), seconds: Second(20)) ==
            "Pour 60g of hot water in 20 seconds.")
        #expect(RecipeLabels.stepPour(water: Gram(60), seconds: Second(1)) ==
            "Pour 60g of hot water in 1 second.")
    }

    @Test
    func stepWait() async throws {
        #expect(RecipeLabels.stepWait(seconds: Second(1)) == "Wait for 1 second.")
        #expect(RecipeLabels.stepWait(seconds: Second(2)) == "Wait for 2 seconds.")
    }
}
