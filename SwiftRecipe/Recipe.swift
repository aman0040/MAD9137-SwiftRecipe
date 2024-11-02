//
//  Recipe.swift
//  SwiftRecipe
//
//  Created by Amandeep on 2024-11-02.
//
import Foundation
import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var ingredients: [String]
    var steps: [String]
    var imageName: String? // Optional image name property
}


