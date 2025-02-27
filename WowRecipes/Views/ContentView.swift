//
//  ContentView.swift
//  WowRecipes
//
//  Created by func$ on 2/20/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State var transientTxt = "...loading..."

    var body: some View {
        VStack {
            // Top filters
            FilterView()
            
            Spacer(minLength: 8)

            // Collection view of recipes
            if viewModel.recipes.count > 0 {
                GridsView(recipes: viewModel.recipes,
                          filter: viewModel.recipeFilter)
            } else {
                // wildcard view for none loaded view ie, loading, error, etc states
                Text(transientTxt)
                    .task {
                        await viewModel.loadRecipes()
                    }
            }
            Spacer(minLength: 4)
        }
        .environmentObject(viewModel)
        .onChange(of: viewModel.errorMsg) { _, newValue in
            // response to the error condition changes
            if let newValue, !newValue.isEmpty {
                transientTxt = newValue
            }
        }
    }
}


#Preview {
    ContentView()
}
