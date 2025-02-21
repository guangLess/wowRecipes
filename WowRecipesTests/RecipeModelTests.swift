//
//  WowRecipesTests.swift
//  WowRecipesTests
//
//  Created by func$ on 2/20/25.
//

import XCTest
@testable import WowRecipes

final class RecipeModelTests: XCTestCase {
    
    func testJsonDecoder() throws {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "Recipes", withExtension: "json")
        guard let urlPath = url else {
            XCTFail("invalid bundle path")
            return
        }
        let data = try Data(contentsOf: urlPath)
        XCTAssertNotNil(data)
    }
}
