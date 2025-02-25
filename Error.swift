//
//  Error.swift
//  WowRecipes
//
//  Created by func$ on 2/25/25.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case invalidResponse
    case responseError(Int)
    case emptyData
    case decodingError(Error)

    var stringfy: String {
        switch self {
        case .badURL:
            "invalid URL"
        case .invalidResponse, .responseError:
            "something wrong with our sever"
        case .emptyData:
            "we do not have any content at the moment"
        case .decodingError:
            "something wrong with our system"
        }
    }
}
