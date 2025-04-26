import SwiftUI


struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                if cartManager.cartItems.isEmpty {
                    EmptyCartView(dismiss: dismiss)
                } else {
                    List {
                        // Cart Items List
                        ForEach($cartManager.cartItems) { $item in
                            CartItemRow(item: $item)
                        }
                        .onDelete { indexSet in
                            cartManager.removeFromCart(at: indexSet)
                        }
                        
                        // Pricing Section
                        Section {
                            VStack(spacing: 8) {
                                HStack {
                                    Text("Subtotal")
                                    Spacer()
                                    Text(cartManager.formattedSubtotal)
                                }
                                
                                HStack {
                                    Text("Delivery Charge")
                                    Spacer()
                                    Text(cartManager.formattedDeliveryCharge) 
                                }
                                
                                Divider()
                                
                                HStack {
                                    Text("Total")
                                        .font(.headline)
                                    Spacer()
                                    Text(cartManager.formattedTotal)
                                        .font(.headline)
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(.insetGrouped)
                    
                    // Checkout Section
                    CheckoutButton()
                }
            }
            .navigationTitle("My Cart")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct EmptyCartView: View {
    let dismiss: DismissAction
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "cart.fill")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("Your cart is empty")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Button {
                dismiss()
            } label: {
                Text("Continue Shopping")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct CartItemRow: View {
    @Binding var item: CartItem
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(item.product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.product.name)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(item.product.price)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            QuantityStepper(quantity: $item.quantity)
        }
        .padding(.vertical, 8)
    }
}

struct QuantityStepper: View {
    @Binding var quantity: Int
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                if quantity > 1 { quantity -= 1 }
            } label: {
                Image(systemName: "minus")
                    .frame(width: 30, height: 30)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
            }
            .disabled(quantity <= 1)
            
            Text("\(quantity)")
                .frame(minWidth: 20)
            
            Button {
                quantity += 1
            } label: {
                Image(systemName: "plus")
                    .frame(width: 30, height: 30)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(5)
            }
        }
        .buttonStyle(.plain)
    }
}

struct CheckoutButton: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            VStack(spacing: 15) {
                HStack {
                    Text("Total:")
                        .font(.headline)
                    Spacer()
                    Text(cartManager.formattedTotal)
                        .font(.headline)
                        .foregroundColor(.green)
                }
                .padding(.horizontal)
                
                Button {
                    // Handle checkout logic
                } label: {
                    Text("Proceed to Checkout")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            .background(Color(.systemBackground))
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
