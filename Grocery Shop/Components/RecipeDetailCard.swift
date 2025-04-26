//
//  RecipeDetailCard.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-24.
//

import SwiftUI

struct RecipeDetailCard: View {
    let recipe: RecipeCardModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Recipe name as title
                Text(recipe.recipeName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Recipe Image
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                
                // Ingredients
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(recipe.ingredients)
                        .font(.body)
                }
                
                // Directions
                VStack(alignment: .leading, spacing: 8) {
                    Text("Directions")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(recipe.directions)
                        .font(.body)
                }
                
                // Order note
                VStack(alignment: .leading, spacing: 8) {
                    Text("Note")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("You can order all items from here that you need to make \(recipe.recipeName). This is for 2 persons.")
                        .font(.body)
                }
                
                // Order button
                Button(action: {
                    // Handle order action
                    print("Ordering items for \(recipe.recipeName)")
                }) {
                    Text("Order All Items")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.vertical)
                
                // AR note
                VStack(alignment: .leading, spacing: 8) {
                    Text("AR Experience")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Experience your meal in augmented reality before even taking a bite! Visualize your dish in 3D after preparation, making your dining experience more immersive and exciting.")
                        .font(.body)
                }
                
                // AR button
                Button(action: {
                    // Handle AR view action
                    print("Viewing \(recipe.recipeName) in AR")
                }) {
                    Text("View in AR")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 30)
            }
            .padding()
        }
    }
}

#Preview {
    RecipeDetailCard(recipe: RecipeCardModel(
        recipeName: "Avocado Toast",
        ingredients: "Bread, Avocado, Lemon, Salt",
        imageName: "avocado-toast",
        category: "Breakfast",
        directions: "1. Toast the bread\n2. Mash the avocado with lemon juice and salt\n3. Spread on toast\n4. Add optional toppings like chili flakes or eggs",
        arModelName: "avocado_toast"
    ))
}
