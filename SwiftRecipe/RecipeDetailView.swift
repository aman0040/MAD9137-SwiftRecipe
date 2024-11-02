//
//  RecipeDetailView.swift
//  SwiftRecipe
//
//  Created by Amandeep on 2024-11-02.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var viewModel: RecipeViewModel
    let recipe: Recipe
    @State private var showingEditRecipeView = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let imageName = recipe.imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .cornerRadius(10)
                }
                
                Text(recipe.title).font(.largeTitle).padding(.bottom, 5)
                Text(recipe.description).font(.body).padding(.bottom, 5)
                
                Text("Ingredients").font(.headline)
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("- \(ingredient)")
                }
                
                Text("Steps").font(.headline)
                ForEach(recipe.steps, id: \.self) { step in
                    Text(step)
                }
            }
            .padding()
        }
        .navigationTitle(recipe.title)
        .navigationBarItems(trailing: Button("Edit") {
            showingEditRecipeView = true
        })
        .sheet(isPresented: $showingEditRecipeView) {
            AddEditRecipeView(viewModel: viewModel, recipeToEdit: recipe)
        }
    }
}
