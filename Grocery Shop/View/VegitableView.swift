//
//  VegitableView.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-23.
//

import SwiftUI

struct VegetableView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var searchText = ""
    
    // Sample vegetable products data
    let vegetableProducts = [
        Product(
            id: "VEG-001",
            name: "Fresh Carrots 500g",
            price: "Rs.120.00",
            image: "Carrots",
            description: "Fresh organic carrots, rich in beta-carotene"
        ),
        Product(
            id: "VEG-002",
            name: "Broccoli 1kg",
            price: "Rs.250.00",
            image: "broccoli",
            description: "Fresh green broccoli, packed with nutrients"
        ),
        Product(
            id: "VEG-003",
            name: "Tomatoes 1kg",
            price: "Rs.180.00",
            image: "tomatoes",
            description: "Juicy red tomatoes, perfect for salads and cooking"
        ),
        Product(
            id: "VEG-004",
            name: "Bell Peppers 500g",
            price: "Rs.220.00",
            image: "bellpeppers",
            description: "Colorful bell peppers, great for stir-fries"
        ),
        Product(
            id: "VEG-005",
            name: "Spinach 250g",
            price: "Rs.90.00",
            image: "spinach",
            description: "Fresh leafy spinach, iron-rich greens"
        ),
        Product(
            id: "VEG-006",
            name: "Potatoes 1kg",
            price: "Rs.150.00",
            image: "potatoes",
            description: "Versatile potatoes for all your cooking needs"
        )
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search vegetables...", text: $searchText)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.horizontal)
                .frame(height: 40)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Popular Vegetables Section
                VStack(alignment: .leading) {
                    Text("Fresh Vegetables")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 15),
                                      GridItem(.flexible(), spacing: 15),
                                      GridItem(.flexible())], spacing: 15) {
                        ForEach(vegetableProducts, id: \.id) { product in
                            NavigationLink(value: product) {
                                ProductCard(product: product)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
                
                // Seasonal Specials Section
                VStack(alignment: .leading) {
                    Text("Seasonal Specials")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(vegetableProducts.shuffled().prefix(4)) { product in
                                NavigationLink(value: product) {
                                    ProductCard(product: product)
                                        .frame(width: 150)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .navigationTitle("Vegetables")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Product.self) { product in
            ProductDetailView(product: product)
        }
    }
}

#Preview {
    NavigationStack {
        VegetableView()
    }
    .environmentObject(CartManager())
}
