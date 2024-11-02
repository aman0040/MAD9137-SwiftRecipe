//
//  AddEditRecipeView..swift
//  SwiftRecipe
//
//  Created by Amandeep on 2024-11-02.
//

import SwiftUI

struct AddEditRecipeView: View {
    @ObservedObject var viewModel: RecipeViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var description = ""
    @State private var ingredients = [""]
    @State private var steps = [""]

    var recipeToEdit: Recipe?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recipe Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }

                Section(header: Text("Ingredients")) {
                    ForEach(0..<ingredients.count, id: \.self) { index in
                        TextField("Ingredient \(index + 1)", text: $ingredients[index])
                    }
                    Button(action: {
                        ingredients.append("")
                    }) {
                        Text("Add Ingredient")
                    }
                }

                Section(header: Text("Steps")) {
                    ForEach(0..<steps.count, id: \.self) { index in
                        TextField("Step \(index + 1)", text: $steps[index])
                    }
                    Button(action: {
                        steps.append("")
                    }) {
                        Text("Add Step")
                    }
                }
            }
            .navigationTitle(recipeToEdit == nil ? "Add Recipe" : "Edit Recipe")
            .navigationBarItems(trailing: Button("Save") {
                let newRecipe = Recipe(
                    title: title,
                    description: description,
                    ingredients: ingredients.filter { !$0.isEmpty },
                    steps: steps.filter { !$0.isEmpty }
                )
                
                if let recipeToEdit = recipeToEdit, let index = viewModel.recipes.firstIndex(where: { $0.id == recipeToEdit.id }) {
                    viewModel.updateRecipe(newRecipe, at: index)
                } else {
                    viewModel.addRecipe(newRecipe)
                }

                presentationMode.wrappedValue.dismiss()
            })
            .onAppear {
                if let recipe = recipeToEdit {
                    title = recipe.title
                    description = recipe.description
                    ingredients = recipe.ingredients
                    steps = recipe.steps
                }
            }
        }
    }
}
