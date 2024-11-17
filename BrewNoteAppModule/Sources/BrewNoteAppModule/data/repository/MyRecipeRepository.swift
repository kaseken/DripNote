import Foundation

protocol MyRecipeRepository {
    func getRecipes() async throws -> [Recipe]
}

struct MyRecipeRepositoryImpl: MyRecipeRepository {
    // Return default recipes.
    func getRecipes() async throws -> [Recipe] {
        return []
    }
}
