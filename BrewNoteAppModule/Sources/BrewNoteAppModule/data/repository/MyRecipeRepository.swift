import Foundation

protocol MyRecipeRepository {
    func getRecipes() async throws -> [Recipe]
}

struct MyRecipeRepositoryImpl: MyRecipeRepository {
    // TODO: Return recipes from DB.
    func getRecipes() async throws -> [Recipe] {
        return [kDefaultRecipe]
    }
}
