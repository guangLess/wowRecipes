//
//  ContentView.swift
//  WowRecipes
//
//  Created by func$ on 2/20/25.
//

import SwiftUI

enum SortedBy: String, CaseIterable {
    case random
    case cuisine
    case name
}

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            HStack {
                ForEach(SortedBy.allCases, id: \.rawValue) { filter  in
                    Button(filter.rawValue) {
                        
                    }
                }

            }

            if viewModel.recipes.count > 0 {
                //RecipeView(recipe: viewModel.recipes[4])
                GridsView(recipes: viewModel.recipes)
            } else {
                Text("...loading...")
                    .task {
                        await viewModel.loadRecipes()
                    }

            }
        }
    }
}

#Preview {
    ContentView()
}


@MainActor
class ViewModel: ObservableObject {

    @Published var recipes = [Recipe]()

    func loadRecipes() async {
        do {
            let apiClient =  APIClient(recipeEndPoint: RecipeEndpoint())
            let networkLayer = NetworkLayer(apiClient: apiClient)

            let data = try await networkLayer.requestData()
            recipes = try networkLayer.getRecipes(data: data)
        } catch {
            print("log error\(error.localizedDescription)")
        }
    }
}
