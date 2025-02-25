//
//  RecipeViewModel.swift
//  WowRecipes
//
//  Created by func$ on 2/25/25.
//
import Foundation

@MainActor
class ViewModel: ObservableObject {

    @Published var recipes = [Recipe]()
    @Published var recipeFilter: RecipeFilter = .original
    @Published var errorMsg: String? = nil

    private var errorCondition: Error? = nil {
        didSet {
            if let errorCondition {
                // pass user friendly msg to UI layer
                if let castedError = errorCondition as? NetworkError {
                    errorMsg = castedError.stringfy
                }
                // got the error to the tracking system if there is one
                print("error: \(errorCondition.localizedDescription )")
            }
        }
    }

    func loadRecipes() async {
        do {
            let apiClient =  APIClient(recipeEndPoint: RecipeEndpoint())
            let networkLayer = NetworkLayer(apiClient: apiClient)

            let data = try await networkLayer.requestData()
            recipes = try networkLayer.getRecipes(data: data)
            
            if recipes.isEmpty {
                errorCondition = NetworkError.emptyData
            }

        } catch(let error) {
            errorCondition = error
        }
    }
    
    func filterAction(_ filter: RecipeFilter) async {
        recipeFilter = filter
        
        switch recipeFilter {
        case .cuisine:
            sortByCuisine()
        case .original:
            recipes = [Recipe]()
            await loadRecipes()
        case .random:
            randomize()
        }
    }

    private func randomize() {
        recipes = recipes.shuffled()
    }

    private func sortByCuisine() {
        recipes = recipes.sorted { $0.cuisine > $1.cuisine }
    }
}
