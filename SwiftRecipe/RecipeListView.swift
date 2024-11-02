//
//  RecipeListView.swift
//  SwiftRecipe
//
//  Created by Amandeep on 2024-11-02.
//
import SwiftUI

struct RecipeListView: View {
    @ObservedObject var viewModel = RecipeViewModel()
    @State private var searchText = ""
    @State private var showingAddRecipeView = false
    
    var filteredRecipes: [Recipe] {
        viewModel.recipes.filter { recipe in
            searchText.isEmpty || recipe.title.localizedCaseInsensitiveContains(searchText) || recipe.ingredients.joined().localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search...", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List {
                    ForEach(filteredRecipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(viewModel: viewModel, recipe: recipe)) {
                            HStack {
                                if let imageName = recipe.imageName {
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                }
                                VStack(alignment: .leading) {
                                    Text(recipe.title).font(.headline)
                                    Text(recipe.description).font(.subheadline).foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteRecipe)
                }
                .navigationTitle("Recipes")
                .navigationBarItems(trailing: Button(action: {
                    showingAddRecipeView = true
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingAddRecipeView) {
                    AddEditRecipeView(viewModel: viewModel)
                }
            }
        }
    }

    func deleteRecipe(at offsets: IndexSet) {
        viewModel.recipes.remove(atOffsets: offsets)
    }
}
