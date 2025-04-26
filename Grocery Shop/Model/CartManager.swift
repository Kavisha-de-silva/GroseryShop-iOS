import Foundation
import UserNotifications

class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = [] {
        didSet {
            saveCartData()
            sendCartNotification()
        }
    }
    
    private let cartKey = "SavedCartItems"
    let deliveryCharge: Double = 150.00
    
    
    func addToCart(product: Product, quantity: Int = 1) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += quantity
        } else {
            cartItems.append(CartItem(product: product, quantity: quantity))
        }
    }
    
    func removeFromCart(at offsets: IndexSet) {
        cartItems.remove(atOffsets: offsets)
    }
    
    var formattedDeliveryCharge: String {
        String(format: "Rs.%.2f", deliveryCharge)
    }
    
    func updateQuantity(productId: String, newQuantity: Int) {
        guard let index = cartItems.firstIndex(where: { $0.product.id == productId }) else { return }
        cartItems[index].quantity = newQuantity
    }
    
    func clearCart() {
        cartItems.removeAll()
    }
    
    var subtotal: Double {
        cartItems.reduce(into: 0) {
            $0 + ($1.product.price.numericValue * Double($1.quantity))
        }
    }
    
    var total: Double {
        subtotal + deliveryCharge
    }
    
    var formattedSubtotal: String { formatCurrency(subtotal) }
    var formattedDelivery: String { formatCurrency(deliveryCharge) }
    var formattedTotal: String { formatCurrency(total) }
    
    private func formatCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "Rs."
        return formatter.string(from: NSNumber(value: value)) ?? "Rs.0.00"
    }
    
    init() {
        loadCartData()
    }
    
    private func saveCartData() {
        do {
            let data = try JSONEncoder().encode(cartItems)
            UserDefaults.standard.set(data, forKey: cartKey)
        } catch {
            print("Error saving cart: \(error.localizedDescription)")
        }
    }
    
    private func loadCartData() {
        guard let data = UserDefaults.standard.data(forKey: cartKey) else { return }
        do {
            cartItems = try JSONDecoder().decode([CartItem].self, from: data)
        } catch {
            print("Error loading cart: \(error.localizedDescription)")
        }
    }
    
    private func sendCartNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Cart Updated"
        content.body = "Your cart now has \(totalItems) items"
        content.sound = .default
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    var totalItems: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }
}
