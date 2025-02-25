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
                    ProgressView()
                }
            }

            Text(name)
                .lineLimit(1)
                .minimumScaleFactor(0.3)
       //         .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .bottomLeading)
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .frame(height: 50)
                .font(.system(.title, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0), .black.opacity(1)]),
                                   startPoint: .top, endPoint: .bottom)
                )
                .border(.orange, width: 2)
                .padding(.horizontal, 6)
        }
    }
}

#Preview {
    RecipePreView(imageURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/small.jpg", name: "White Chocolate Crème Brûlée")
}

/**
 recipe: Recipe(uuid: "x",
 cuisine: "Brooklyn",
 name: "White Chocolate Crème Brûlée",
 photoUrlLarge: " https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg",
 sourceUrl: "https://www.bbcgoodfood.com/recipes/canadian-butter-tarts",
 youtubeUrl: "https://www.youtube.com/watch?v=YMmgKCNcqwI")

 */
