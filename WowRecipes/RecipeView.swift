//
//  RecipeView.swift
//  WowRecipes
//
//  Created by func$ on 2/21/25.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            RecipePreView(imageURL: recipe.photoUrlLarge, name: recipe.name, textNeedsToBeFullWidth: true)

            Text(recipe.cuisine + " " + "cuisine")
                .font(.system(.body, design: .serif))
                .fontWeight(.medium)
                .padding([.horizontal, .top], 20)
            
            if let sourceURLString = recipe.sourceUrl,
               let url = URL(string: sourceURLString) {
                Link("Give this recipe a try", destination: url)
                    .environment(\.openURL, OpenURLAction { url in
                        return .handled
                    })
                    .font(.system(.body, design: .serif))
                    .fontWeight(.regular)
                    .foregroundColor(.green)
                    .background(.orange)
                    .padding(.horizontal, 20)
            }
            Spacer()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    RecipeView(recipe: Recipe(uuid: "x",
                              cuisine: "Brooklyn",
                              name: "White Chocolate Crème Brûlée",
                              photoUrlLarge: " https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg",
                              sourceUrl: "https://www.bbcgoodfood.com/recipes/canadian-butter-tarts",
                              youtubeUrl: "https://www.youtube.com/watch?v=YMmgKCNcqwI")
    )
}
