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
            FilterView()
            Spacer(minLength: 8)
            if viewModel.recipes.count > 0 {
                GridsView(recipes: viewModel.recipes,
                          filter: viewModel.recipeFilter)
            } else {
                Text(transientTxt)
                    .task {
                        await viewModel.loadRecipes()
                    }
            }
            Spacer(minLength: 4)
        }
        .environmentObject(viewModel)
        .onChange(of: viewModel.errorMsg) { _, newValue in
            if let newValue, !newValue.isEmpty {
                transientTxt = newValue
            }
        }
    }
}


#Preview {
    ContentView()
}
