
import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var quantity: Int = 1
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Product Image
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(12)
                    .padding(.bottom)
                
                // Product Info
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(product.price)
                        .font(.title2)
                        .foregroundColor(.green)
                    
                    Text("Product ID: \(product.id)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Divider()
                
                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.headline)
                    
                    Text(product.description)
                        .font(.body)
                }
                
                Divider()
                
                // Quantity Selector
                HStack {
                    Text("Quantity:")
                        .font(.headline)
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            if quantity > 1 {
                                quantity -= 1
                            }
                        }) {
                            Image(systemName: "minus")
                                .padding(8)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                        }
                        .disabled(quantity <= 1)
                        
                        Text("\(quantity)")
                            .frame(width: 40)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            quantity += 1
                        }) {
                            Image(systemName: "plus")
                                .padding(8)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                        }
                    }
                }
                .padding(.vertical)
                
                // Buttons
                VStack(spacing: 12) {
                    // Recipes Button
                    Button(action: {
                        // Handle recipes action
                        print("Recipes button tapped for \(product.name)")
                    }) {
                        Text("Recipes")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    // Add to Cart Button
                    // In the Add to Cart button section of ProductDetailView
                    Button(action: {
                        cartManager.addToCart(product: product, quantity: quantity)
                    }) {
                        Text("Add to Cart (\(quantity)) - \(String(format: "Rs.%.2f", (product.price.numericValue * Double(quantity)) + cartManager.deliveryCharge))")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductDetailView(product: Product(
        id: "PRD-001",
        name: "Top Crust Bread 450g",
        price: "Rs.140.00",
        image: "bread",
        description: "Freshly baked bread with a crispy crust and soft interior. Perfect for sandwiches or toast."
    ))
    .environmentObject(CartManager())
}
