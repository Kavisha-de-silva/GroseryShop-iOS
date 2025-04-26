

import SwiftUI




struct ContentView: View {
    @EnvironmentObject var cartManager: CartManager
    @StateObject var authManager = BiometricAuthManager()
    @AppStorage("isAppLaunchedBefore") var isAppLaunchedBefore: Bool = false
    
    var body: some View {
        Group {
            if isAppLaunchedBefore {
                if authManager.isAuthenticated {
                    MainTabView()
                        .environmentObject(authManager)
                } else {
                    LockScreenView()
                        .environmentObject(authManager)
                }
            } else {
                MainTabView()
            }
        }
    }
}

