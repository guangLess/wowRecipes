//
//  ApiClient.swift
//  WowRecipes
//
//  Created by func$ on 2/21/25.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case invalidResponse
    case responseError(Int)
}

struct APIClient {
    let recipeEndPoint: EndPoint
    func constructToURL() throws -> URL {
        var comp = URLComponents()
        comp.scheme = "https"
        comp.host = recipeEndPoint.host
        comp.path = recipeEndPoint.path

        guard let url = comp.url else {
            throw NetworkError.badURL
        }
        return url
    }
}
