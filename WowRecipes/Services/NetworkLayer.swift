//
//  NetworkLayer.swift
//  WowRecipes
//
//  Created by func$ on 2/21/25.
//

import Foundation

struct NetworkLayer {
    let apiClient: APIClient

    func requestData() async throws -> Data {
        let request = URLRequest(url: try apiClient.constructToURL())
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let res = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard res.statusCode < 400 else {
            throw NetworkError.responseError(res.statusCode)
        }

        return data
    }

    func getRecipes(data: Data) throws -> [Recipe] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let result = try decoder.decode(RecipesContainer.self, from: data)
            let list = result.recipes
            return list
        } catch {
            throw NetworkError.decodingError(error)
        }
        
    }
}
