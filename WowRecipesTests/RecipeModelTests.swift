//
//  WowRecipesTests.swift
//  WowRecipesTests
//
//  Created by func$ on 2/20/25.
//

import XCTest
@testable import WowRecipes

// add mal data with more time
final class RecipeModelTests: XCTestCase {
  
    let pathTxt = "/recipes.json"
    let hostTxt = "cloudfront"
    let endpoint = RecipeEndpoint()

    func testConstructToRecipeURL() throws {
        let client = APIClient(recipeEndPoint: endpoint)
        let url = try client.constructToURL()

        XCTAssertEqual(url.path(), pathTxt)
        XCTAssertTrue(try XCTUnwrap(url.host()).contains(hostTxt))
    }

    func testConstructToBadURL() throws {
        struct ErrorEndPoint: EndPoint {
            let host: String = ""
            let path: String = "3"
        }
        let errorClient = APIClient(recipeEndPoint: ErrorEndPoint())
        XCTAssertThrowsError(try errorClient.constructToURL()) { error in
            XCTAssertTrue(error is NetworkError)
        }
    }

    func testJsonDecoder() throws {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "Recipes", withExtension: "json")
        guard let urlPath = url else {
            XCTFail("invalid bundle path")
            return
        }
        let data = try Data(contentsOf: urlPath)
        XCTAssertNotNil(data)


        let networkLayer = NetworkLayer(apiClient: APIClient(recipeEndPoint: endpoint))
        
        let list = try networkLayer.getRecipes(data: data)
        XCTAssertEqual(list.count, 3)
        XCTAssertEqual(list[0].cuisine, "British")
        XCTAssertNotEqual(list[1].id, list[2].id)
    }

    func testEmptyData() throws {
        let json = """
                    {
                        "recipes": []
                    }
                    """
        let data = json.data(using: .utf8)!
        let networkLayer = NetworkLayer(apiClient: APIClient(recipeEndPoint: endpoint))
        let list = try networkLayer.getRecipes(data: data)
        XCTAssertTrue(list.isEmpty, "list")
    }
}
