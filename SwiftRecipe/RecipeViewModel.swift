//
//  RecipeViewModel.swift
//  SwiftRecipe
//
//  Created by Amandeep on 2024-11-02.
//
import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = [
        Recipe(title: "Pasta", description: "Delicious homemade pasta", ingredients: ["Pasta", "Tomato sauce"], steps: ["Boil pasta", "Add sauce"], imageName: "Pasta"),
        Recipe(title: "Salad", description: "Fresh garden salad", ingredients: ["Lettuce", "Tomato"], steps: ["Chop ingredients", "Mix together"], imageName: "Salad"),
        Recipe(title: "Chicken Curry", description: "Spicy and flavorful chicken curry", ingredients: ["Chicken", "Onions", "Tomato puree", "Spices"], steps: ["Marinate chicken", "Cook onions", "Add spices", "Add chicken"], imageName: "ChickenCurry"),
        Recipe(title: "Vegetable Stir Fry", description: "Healthy and quick stir fry with mixed vegetables", ingredients: ["Carrots", "Bell peppers", "Broccoli", "Soy sauce"], steps: ["Chop vegetables", "Stir fry in pan", "Add soy sauce"], imageName: "VegetableStirFry"),
        Recipe(title: "Beef Stew", description: "Hearty beef stew with potatoes and carrots", ingredients: ["Beef", "Potatoes", "Carrots", "Beef broth"], steps: ["Brown beef", "Add vegetables", "Simmer with broth"], imageName: "BeefStew"),
        Recipe(title: "Pancakes", description: "Fluffy breakfast pancakes", ingredients: ["Flour", "Milk", "Eggs", "Baking powder"], steps: ["Mix ingredients", "Pour batter", "Flip when bubbly"], imageName: "Pancakes"),
        Recipe(title: "Grilled Cheese", description: "Classic grilled cheese sandwich", ingredients: ["Bread", "Cheese", "Butter"], steps: ["Butter bread", "Add cheese", "Grill until golden"], imageName: "GrilledCheese"),
        Recipe(title: "Chocolate Cake", description: "Rich chocolate cake with frosting", ingredients: ["Flour", "Cocoa powder", "Sugar", "Eggs", "Butter"], steps: ["Mix ingredients", "Bake at 350°F", "Apply frosting"], imageName: "ChocolateCake"),
        Recipe(title: "Tomato Soup", description: "Creamy and comforting tomato soup", ingredients: ["Tomatoes", "Onions", "Garlic", "Cream"], steps: ["Sauté onions and garlic", "Add tomatoes", "Blend and add cream"], imageName: "TomatoSoup"),
        Recipe(title: "Garlic Bread", description: "Crispy garlic bread", ingredients: ["Bread", "Garlic", "Butter", "Parsley"], steps: ["Butter bread with garlic", "Bake until crispy"], imageName: "GarlicBread"),
        Recipe(title: "Tacos", description: "Mexican-style beef tacos with toppings", ingredients: ["Taco shells", "Ground beef", "Lettuce", "Cheese", "Salsa"], steps: ["Cook beef", "Assemble in taco shells", "Add toppings"], imageName: "Tacos"),
        Recipe(title: "Caesar Salad", description: "Classic Caesar salad with croutons and dressing", ingredients: ["Romaine lettuce", "Croutons", "Caesar dressing", "Parmesan"], steps: ["Chop lettuce", "Add croutons", "Drizzle with dressing"], imageName: "CaesarSalad")
    ]
   
    func addRecipe(_ recipe: Recipe) {
        recipes.append(recipe)
    }
    
    func deleteRecipe(at index: Int) {
        recipes.remove(at: index)
    }
    
    func updateRecipe(_ recipe: Recipe, at index: Int) {
        recipes[index] = recipe
    }
}
