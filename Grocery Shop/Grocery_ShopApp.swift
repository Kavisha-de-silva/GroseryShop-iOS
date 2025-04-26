//
//  Grocery_ShopApp.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-03.
//

import SwiftUI
import UserNotifications

@main
struct Grocery_ShopApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var cartManager = CartManager()
    @StateObject var authManager = BiometricAuthManager()
    @StateObject var notificationManager = NotificationManager.shared
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authManager.isAuthenticated {
                    ContentView()
                        .transition(.opacity)
                } else {
                    LockScreenView()
                        .transition(.opacity)
                }
            }
            .environmentObject(cartManager)
            .environmentObject(authManager)
            .environmentObject(notificationManager)
            .onAppear {
                notificationManager.requestPermission()
                
                if !authManager.isAuthenticated {
                    authManager.authenticate()
                }
            }
        }
    }
}

