//
//  RecipesView.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-04.
//

import SwiftUI

struct RecipesView: View {
    @State private var searchText = ""
    @State private var selectedCategory: String?
    
    let categories = ["Breakfast", "Lunch", "Dinner", "Snack"]
    
    let allRecipes = [
        RecipeCardModel(
            recipeName: "Avocado Toast",
            ingredients: "*Bread - 4 slice\n*Avocado - 200g\n*Lemon - 2 drops\n*Salt - 2g",
            imageName: "av",
            category: "Breakfast",
            directions: "1. Toast the bread\n2. Mash the avocado with lemon juice and salt\n3. Spread on toast\n4. Add optional toppings like chili flakes or eggs",
            arModelName: "avocado_toast"
        ),
        RecipeCardModel(
            recipeName: "Vegetable Pasta",
            ingredients: "Pasta, Tomatoes, Zucchini, Garlic, Olive oil",
            imageName: "vp",
            category: "Lunch",
            directions: "1. Cook pasta according to package\n2. Sauté garlic in olive oil\n3. Add chopped vegetables and cook until tender\n4. Mix with pasta and season",
            arModelName: "vegetable_pasta"
        )
    ]
    
    var filteredRecipes: [RecipeCardModel] {
        if let category = selectedCategory {
            return allRecipes.filter { $0.category == category }
        }
        return allRecipes
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                headerView
                
                // Scrollable content
                ScrollView {
                    VStack(spacing: 16) {
                        
                        searchBarView
                        
                        categoryButtonsView
                        
                        recipeCardsView
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    // MARK: - Subviews
    private var headerView: some View {
        HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hello")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                        Text("Kavi")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image("logo fresh cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.bottom, 20)
                .frame(minHeight: 100)
                .background(Color.green)
                .ignoresSafeArea(.container, edges: .top)
    }
    
    private var searchBarView: some View {
       HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search recipes...", text: $searchText)
                        .autocorrectionDisabled()
                    
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top, 16)
    }
    
    private var categoryButtonsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = selectedCategory == category ? nil : category
                            }) {
                                VStack {
                                    Circle()
                                        .fill(selectedCategory == category ? Color.green.opacity(0.7) : Color.green)
                                        .frame(width: 70, height: 70)
                                        .overlay(
                                            Image(systemName: categoryIcon(for: category))
                                                .foregroundColor(.white)
                                                .font(.system(size: 24))
                                        )
                                    Text(category)
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(.black)
                                }
                                .frame(width: 80)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 8)
    }
    
    private var recipeCardsView: some View {
        VStack(spacing: 16) {
            if selectedCategory != nil {
                HStack {
                    Text(selectedCategory!)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        selectedCategory = nil
                    }) {
                        Text("Clear")
                            .foregroundColor(.green)
                    }
                }
                .padding(.horizontal)
            }
            
            ForEach(filteredRecipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    RecipeCard(
                        recipeName: recipe.recipeName,
                        ingredients: recipe.ingredients,
                        imageName: recipe.imageName
                    )
                    .padding(.horizontal)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.vertical, 8)
    }
    
    private func categoryIcon(for category: String) -> String {
        switch category {
                case "Breakfast": return "sun.haze.fill"
                case "Lunch": return "fork.knife"
                case "Dinner": return "moon.fill"
                case "Snack": return "leaf.fill"
                default: return "questionmark"
                }
    }
}

// MARK: - Recipe Detail View
struct RecipeDetailView: View {
    let recipe: RecipeCardModel
    
    var body: some View {
        RecipeDetailCard(recipe: recipe)
            .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    RecipesView()
}
