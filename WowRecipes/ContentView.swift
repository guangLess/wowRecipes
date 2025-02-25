//
//  ContentView.swift
//  WowRecipes
//
//  Created by func$ on 2/20/25.
//

import SwiftUI

enum RecipeFilter: String, CaseIterable {
    case cuisine
    case random
    case original = "reload"
}

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

struct FilterView: View {
    @EnvironmentObject private var recipeViewModel: ViewModel

    var body: some View {
        HStack() {
            ForEach(RecipeFilter.allCases, id: \.rawValue) { filter in
                Button(filter.rawValue) {
                    Task {
                        await recipeViewModel.filterAction(filter)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .font(.system(.body, design: .serif))
                .fontWeight(.bold)
                .foregroundStyle(.brown)
                .background(.yellow, in: Capsule())
            }
        }
        .padding(.horizontal, 4)
        .border(.red, width: 2)
    }
}


#Preview {
    ContentView()
}
