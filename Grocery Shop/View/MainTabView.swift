import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var navigationPath = NavigationPath()
    @StateObject private var cartManager = CartManager()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Home Tab
            NavigationStack(path: $navigationPath) {
                HomeView(navigationPath: $navigationPath)
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)
            
            // Categories Tab
            NavigationStack {
                CategoriesView()
            }
            .tabItem {
                Label("Categories", systemImage: "square.grid.2x2.fill")
            }
            .tag(1)
            
            // Recipes Tab
            NavigationStack {
                RecipesView()
            }
            .tabItem {
                Label("Recipes", systemImage: "book.fill")
            }
            .tag(2)
            
            // Cart Tab with badge
            NavigationStack {
                CartView()
            }
            .tabItem {
                Label("Cart", systemImage: "cart.fill")
            }
            .badge(cartManager.totalItems)
            .tag(3)
            
            // Profile Tab
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(4)
        }
        .environmentObject(cartManager)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(Color(.systemBackground), for: .tabBar)
        .tint(.green)
        .onChange(of: navigationPath) { _ in
            // Handle deep links to specific tabs
            if navigationPath.count > 0 {
                selectedTab = determineTabFromPath(navigationPath)
            }
        }
    }
    
    private func determineTabFromPath(_ path: NavigationPath) -> Int {
        return 0
    }
}

#Preview {
    MainTabView()
        .environmentObject(CartManager())
}
