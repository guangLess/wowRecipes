//
//  RecipePreView.swift
//  WowRecipes
//
//  Created by func$ on 2/21/25.
//

import SwiftUI

struct RecipePreView: View {
    let imageURL: String?
    let name: String
    let textNeedsToBeFullWidth: Bool

    var body: some View {
        ZStack(alignment: .bottom) {
            if let imageURL {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .border(.purple, width: 10)
                } placeholder: {
                    Color.green
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                }
            }

            Text(name)
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .lineLimit(1)
                .minimumScaleFactor(textNeedsToBeFullWidth ? 0.3 : 1)
                .font(.system(textNeedsToBeFullWidth ? .title :.body, design: .serif))
                .fontWeight(.bold)
                .padding([.horizontal, .bottom], 6)
                .foregroundColor(.white)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0), .brown.opacity(1)]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
                .border(.orange, width: 2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    RecipePreView(imageURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/small.jpg", name: "White Chocolate Crème Brûlée", textNeedsToBeFullWidth: true)
}

/**
 recipe: Recipe(uuid: "x",
 cuisine: "Brooklyn",
 name: "White Chocolate Crème Brûlée",
 photoUrlLarge: " https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg",
 sourceUrl: "https://www.bbcgoodfood.com/recipes/canadian-butter-tarts",
 youtubeUrl: "https://www.youtube.com/watch?v=YMmgKCNcqwI")

 */
