//
//  RecipeView.swift
//  WowRecipes
//
//  Created by func$ on 2/21/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading) {
            RecipeImageView(imageURL: recipe.photoUrlLarge, name: recipe.name, textNeedsToBeFullWidth: true)
                .overlay(
                    Button(action: { 
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.brown)
                            .padding([.trailing,.vertical], 8)
                    }
                    ,alignment: .topTrailing
                )
            if let sourceURLString = recipe.sourceUrl,
               let url = URL(string: sourceURLString) {
                HStack {
                    Spacer()
                    Link("Give this recipe a try", destination: url)
                        .font(.system(.body, design: .serif))
                        .fontWeight(.regular)
                        .foregroundColor(.green)
                        .padding(10)
                        .background(Capsule()
                        .fill(Color.brown.opacity(0.5)))
                    Spacer()
                }
            }

            Text(recipe.cuisine + " " + "cuisine")
                .font(.system(.body, design: .serif))
                .fontWeight(.medium)
                .padding([.horizontal, .top], 20)
            Spacer()
        }
    }
}

#Preview {
    RecipeDetailView(recipe: Recipe(uuid: "x",
                              cuisine: "Brooklyn",
                              name: "White Chocolate Crème Brûlée",
                              photoUrlLarge: " https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg",
                              sourceUrl: "https://www.bbcgoodfood.com/recipes/canadian-butter-tarts",
                              youtubeUrl: "https://www.youtube.com/watch?v=YMmgKCNcqwI")
    )
}
