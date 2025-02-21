//
//  RecipeModel.swift
//  WowRecipes
//
//  Created by func$ on 2/21/25.
//

import Foundation

/**
 Recipe data structure modeled from the backend, ref to link /backend swagger doc/
 */

struct RecipesContainer: Decodable {
    let recipes: [Recipe]
}

struct Recipe: Decodable {
    let uuid: String
    let cuisine: String
    let name: String

    var photoUrlLarge: String?
    var photoUrlSmall: String?
    var sourceUrl: String?
    var youtubeUrl: String?
}

extension Recipe: Identifiable {
    var id: String { uuid }
}
