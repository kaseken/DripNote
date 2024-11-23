import Foundation

protocol RecipeRepository {
    func getRecipes() async throws -> [Recipe]
}

struct RecipeRepositoryImpl: RecipeRepository {
    // TODO: Return recipes from DB.
    func getRecipes() async throws -> [Recipe] {
        return [kDefaultRecipe]
    }
}
