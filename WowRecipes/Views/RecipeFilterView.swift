//
//  RecipeFilterView.swift
//  WowRecipes
//
//  Created by func$ on 2/27/25.
//

import SwiftUI

enum RecipeFilter: String, CaseIterable {
    case cuisine
    case random
    case original = "reload"
}

/// Top filter view that consists of sorted types.

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
    }
}
