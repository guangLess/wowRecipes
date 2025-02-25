//
//  GridsView.swift
//  WowRecipes
//
//  Created by func$ on 2/21/25.
//

import SwiftUI

struct GridsView: View {
    let recipes: [Recipe]
    let filter: RecipeFilter

        let columns = [
            GridItem(.flexible(minimum: 10, maximum: 500), spacing: 4),
            GridItem(.flexible(minimum: 10, maximum: 500), spacing: 4)
        ]

        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 4) {
                    
                    ForEach(recipes, id: \.id) { item in
                        RecipePreView(imageURL: item.photoUrlSmall,
                                      name: item.name,
                                      textNeedsToBeFullWidth: false)
                    }
                }
                .padding(.horizontal, 4)
            }
            .id(filter.rawValue)
    }
}

#Preview {
    GridsView(recipes: [
        Recipe(uuid: "x",
               cuisine: "Brooklyn",
               name: "White Chocolate Crème Brûlée",
               photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg",
               photoUrlSmall:"https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/small.jpg",
               sourceUrl: "https://www.bbcgoodfood.com/recipes/canadian-butter-tarts",
               youtubeUrl: "https://www.youtube.com/watch?v=YMmgKCNcqwI"),
        Recipe(uuid: "123",
               cuisine: "British gross",
               name: "Chocolate Avocado Mousse",
               photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/27c50c00-148e-4d2a-abb7-942182bb6d94/large.jpg",
               photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/27c50c00-148e-4d2a-abb7-942182bb6d94/small.jpg",
               sourceUrl: "http://www.hemsleyandhemsley.com/recipe/chocolate-avocado-mousse/",
               youtubeUrl: "https://www.youtube.com/watch?v=YMmgKCNcqwI")
        ,
        Recipe(uuid: "125",
               cuisine: "British gross",
               name: "Chocolate Avocado Mousse",
               photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/27c50c00-148e-4d2a-abb7-942182bb6d94/large.jpg",
               photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/27c50c00-148e-4d2a-abb7-942182bb6d94/small.jpg",
               sourceUrl: "http://www.hemsleyandhemsley.com/recipe/chocolate-avocado-mousse/",
               youtubeUrl: "https://www.youtube.com/watch?v=YMmgKCNcqwI") ,
        Recipe(uuid: "x33",
               cuisine: "Brooklyn",
               name: "White Chocolate Crème Brûlée",
               photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg",
               photoUrlSmall:"https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/small.jpg",
               sourceUrl: "https://www.bbcgoodfood.com/recipes/canadian-butter-tarts",
               youtubeUrl: "https://www.youtube.com/watch?v=YMmgKCNcqwI")
    ], filter: .cuisine)
}
