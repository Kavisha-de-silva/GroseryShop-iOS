//
//  FruitsView.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-25.
//

import SwiftUI

struct FruitsView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var searchText = ""
    
    // Sample fruit products data
    let fruitProducts = [
        Product(
            id: "FRT-001",
            name: "Fresh Apples 1kg",
            price: "Rs.300.00",
            image: "apples",
            description: "Crisp and juicy apples, perfect for snacking"
        ),
        Product(
            id: "FRT-002",
            name: "Bananas 1kg",
            price: "Rs.150.00",
            image: "bananas",
            description: "Ripe bananas, great for smoothies or eating fresh"
        ),
        Product(
            id: "FRT-003",
            name: "Oranges 1kg",
            price: "Rs.250.00",
            image: "oranges",
            description: "Sweet and tangy oranges packed with vitamin C"
        ),
        Product(
            id: "FRT-004",
            name: "Grapes 500g",
            price: "Rs.350.00",
            image: "grapes",
            description: "Sweet seedless grapes, perfect for snacks"
        ),
        Product(
            id: "FRT-005",
            name: "Mangoes 1kg",
            price: "Rs.400.00",
            image: "mangoes",
            description: "Seasonal mangoes, sweet and flavorful"
        ),
        Product(
            id: "FRT-006",
            name: "Pineapple 1pc",
            price: "Rs.280.00",
            image: "pineapple",
            description: "Fresh tropical pineapple, great for desserts"
        )
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search fruits...", text: $searchText)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.horizontal)
                .frame(height: 40)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top, 10)
                
               VStack(alignment: .leading) {
                    Text("Fresh Fruits")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .padding(.top, 10);
                    
                   LazyVGrid(columns: [GridItem(.flexible(), spacing: 15),
                                      GridItem(.flexible(), spacing: 15),
                                      GridItem(.flexible())], spacing: 15) {
                        ForEach(fruitProducts, id: \.id) { product in
                            NavigationLink(value: product) {
                                ProductCard(product: product)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    Text("Seasonal Specials")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(fruitProducts.shuffled().prefix(4)) { product in
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
        .navigationTitle("Fruits")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Product.self) { product in
            ProductDetailView(product: product)
        }
    }
}

#Preview {
    NavigationStack {
        FruitsView()
    }
    .environmentObject(CartManager())
}
