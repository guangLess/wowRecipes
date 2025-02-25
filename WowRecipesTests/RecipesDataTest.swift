//
//  RecipesDataTest.swift
//  WowRecipesTests
//
//  Created by func$ on 2/21/25.
//

import XCTest

final class RecipesDataTest: XCTestCase {


    let networkLayer = NetworkLayer(apiClient: APIClient(recipeEndPoint: RecipeEndpoint()))

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
