//
//  AppDelegate.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-25.
//




import UIKit
import FirebaseCore
import UserNotifications
import FirebaseMessaging


class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
}
