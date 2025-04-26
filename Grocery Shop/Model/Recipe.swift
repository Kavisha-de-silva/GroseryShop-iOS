//
//  Recipe.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-24.
//
import Foundation

struct RecipeCardModel: Identifiable {
    let id = UUID()
    let recipeName: String
    let ingredients: String
    let imageName: String
    let category: String
    let directions: String
    let arModelName: String
}
