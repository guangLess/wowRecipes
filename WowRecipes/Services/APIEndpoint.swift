//
//  API.swift
//  WowRecipes
//
//  Created by func$ on 2/21/25.
//

import Foundation

/**
Endpoint consists of standard URL components, edit the properties based on what is requested from client, ex query could be added if client adds a search feature.

various Endpoint could follow this pattern.
*/

protocol EndPoint {
    var host: String { get }
    var path: String { get }
}

struct RecipeEndpoint: EndPoint {
    let host = "d3jbb8n5wk0qxi.cloudfront.net"
    let path = "/recipes.json"
    
    /// only for demo propose
    #if DEBUG
    let malFormedPath = "/recipes-malformed.json"
    let emptyPath = "/recipes-empty.json"
    #endif
}
