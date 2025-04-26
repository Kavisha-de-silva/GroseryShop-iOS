//
//  RecipeCard.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-24.
//

// Components/RecipeCard.swift
import SwiftUI

struct RecipeCard: View {
    let recipeName: String
    let ingredients: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Recipe Image
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(12)
            
            // Recipe Name
            Text(recipeName)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            // Ingredients
            Text(ingredients)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
