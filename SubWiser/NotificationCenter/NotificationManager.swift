//
//  NotificationManager.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 5.02.2026.
//

import UserNotifications

@MainActor
class NotificationManager{
    static let shared = NotificationManager()
    
    private init() {}
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            
        }
    }
    
    func scheduleReminder(subscription: UserSubscription) {
        
        guard subscription.reminder == true else { return}
        let content = UNMutableNotificationContent()
        content.title = "Payment Day: \(subscription.service?.name ?? "Application")"
        content.body = "\(subscription.price) \(subscription.currency) amount."
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: subscription.id,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
}


