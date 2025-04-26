//
//  NotificationManager.swift
//  Fitly-iOS
//
//  Created by Ashan on 2025-04-25.
//

import Foundation
import UserNotifications
import FirebaseMessaging
import UIKit

class NotificationManager: NSObject, ObservableObject {
    static let shared = NotificationManager()
    @Published var latestNotification: String?
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self
    }
    
    // Request notification permissions
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            guard granted else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    // Schedule payment confirmation notification
    func schedulePaymentNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Payment Successful 🎉"
        content.body = "Thank you for your purchase! Your order is being processed."
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(
            identifier: "paymentSuccess",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - Notification Center Delegate
extension NotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        let body = notification.request.content.body
        DispatchQueue.main.async {
            self.latestNotification = body
        }
        return [.banner, .sound]
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse) async {
        let body = response.notification.request.content.body
        DispatchQueue.main.async {
            self.latestNotification = body
        }
    }
}

// MARK: - Firebase Messaging Delegate
extension NotificationManager: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let token = fcmToken else { return }
        print("FCM Token: \(token)")
        // You would typically send this token to your server here
    }
    
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        print("Refreshed FCM Token: \(fcmToken)")
    }
}
