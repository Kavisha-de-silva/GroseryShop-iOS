//
//  ProductCard.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-23.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Product Image
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .cornerRadius(10)
            
            // Product Name
            Text(product.name)
                .font(.subheadline)
                .lineLimit(1)
            
            // Price
            Text(product.price)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            // Add to Cart Button
            Button(action: {
                cartManager.addToCart(product: product, quantity: 1)
            }) {
                Text("Add to Cart")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(8)
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(
            product: Product(
                id: "PRD-001",
                name: "Fresh Milk 1L",
                price: "Rs.550.00",
                image: "milk",
                description: "Fresh milk"
            )
        )
        .environmentObject(CartManager())
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
