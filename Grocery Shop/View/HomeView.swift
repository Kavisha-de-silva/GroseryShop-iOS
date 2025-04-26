//
//  HomeView.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-24.
//

import SwiftUI

struct HomeView: View {
    @Binding var navigationPath: NavigationPath
    @State private var searchText = ""
    @EnvironmentObject var cartManager: CartManager
    
    // Sample banner
    let banners = ["Banner1", "Banner2", "Banner3"]
    @State private var currentBannerIndex = 0
    
    // Categories
    let categories = ["Vegetables", "Fruits", "Beverages", "Frozen Food", "Kids Food", "Grocery", "Snacks"]
    
    // Sample products 
    let products = [
        Product(
            id: "PRD-001",
            name: "Top Crust Bread 450g",
            price: "Rs.140.00",
            image: "bread",
            description: "Freshly baked bread with crispy crust and soft interior. Perfect for sandwiches or toast."
        ),
        Product(
            id: "PRD-002",
            name: "Milk 1L",
            price: "Rs.550.00",
            image: "milk",
            description: "Fresh full cream milk, pasteurized and homogenized. Rich in calcium and vitamins."
        ),
        Product(
            id: "PRD-003",
            name: "Roza Pasta 250g",
            price: "Rs.650.00",
            image: "pasta",
            description: "Premium quality durum wheat pasta. Cooks al dente in 8-10 minutes."
        ),
        Product(
            id: "PRD-004",
            name: "Papaya 100g",
            price: "Rs.31.00",
            image: "papaya",
            description: "Ripe papaya, sweet and juicy. Rich in vitamins A and C, and digestive enzymes."
        ),
        Product(
            id: "PRD-005",
            name: "Carbonara 250g",
            price: "Rs.800.00",
            image: "carabonara",
            description: "Authentic Italian carbonara sauce with pancetta and pecorino cheese."
        ),
        Product(
            id: "PRD-006",
            name: "Vegetable Oil 1L",
            price: "Rs.1350.00",
            image: "oil",
            description: "100% pure vegetable oil, perfect for frying, baking and cooking."
        )
    ]
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            // Fixed top bar and scrollable content
            VStack(spacing: 0) {
                // Fixed Top Bar with Cart Icon
                VStack {
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
                        
                        HStack(spacing: 20) {
                            
                            Image("logo fresh cart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.bottom, 20)
                }
                .frame(minHeight: 100)
                .background(Color.green)
                .edgesIgnoringSafeArea(.top)
                
                // Scrollable Content
                ScrollView {
                    VStack(spacing: 0) {
                        // Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search products...", text: $searchText)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        
                        // Banner Slider
                        TabView(selection: $currentBannerIndex) {
                            ForEach(0..<banners.count, id: \.self) { index in
                                Image(banners[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 150)
                                    .clipped()
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .tag(index)
                            }
                        }
                        .frame(height: 150)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .padding(.bottom, 10)
                        

                        
                        // View Nearest Shop Button
                        Button(action: {
                            navigationPath.append("LocationView")
                        }) {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.white)
                                Text("View Nearest Shop")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                        .padding(.vertical, 5)
                        
                        //Own Order List Button
                        Button(action: {
                            navigationPath.append("OrderListView")
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.white)
                                Text("Add Your Own Order List")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                        .padding(.vertical, 5)
                        
                        // Horizontal
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(categories, id: \.self) { category in
                                    Button(action: {
                                        if category == "Vegetables" {
                                            navigationPath.append("VegetableView")
                                        } 
                                    }) {
                                        Text(category)
                                            .font(.subheadline)
                                            .foregroundColor(.green)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 12)
                                            .background(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.green, lineWidth: 1)
                                                    .background(Color.white.cornerRadius(15))
                                            )
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.bottom, 15)
                        
                        // Best Deals Section
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Best Deals")
                                    .font(.title2)
                                    .bold()
                                
                                Spacer()
                                
                                NavigationLink(value: "AllProductsView") {
                                    Text("See All")
                                        .font(.subheadline)
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 10)
                            
                            
                            LazyVGrid(columns: [GridItem(.flexible(), spacing: 15),
                                        GridItem(.flexible(), spacing: 15),
                                        GridItem(.flexible())], spacing: 15) {
                                ForEach(products, id: \.id) { product in
                                    NavigationLink(value: product) {
                                        ProductCard(product: product)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.bottom, 20)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationDestination(for: String.self) { view in
                switch view {
                case "VegetableView":
                    VegetableView()
                case "LocationView":
                    LocationView()
                case "OrderListView":
                    OrderListView()
                case "CartView":
                    CartView()
                case "AllProductsView":
                    AllProductsView(products: products)
                default:
                    EmptyView()
                }
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
            }
        }
    }
}



struct AllProductsView: View {
    let products: [Product]
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 15),
                              GridItem(.flexible(), spacing: 15),
                              GridItem(.flexible())], spacing: 15) {
                ForEach(products) { product in
                    NavigationLink(value: product) {
                        ProductCard(product: product)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .navigationTitle("All Products")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView(navigationPath: .constant(NavigationPath()))
        .environmentObject(CartManager())
}

