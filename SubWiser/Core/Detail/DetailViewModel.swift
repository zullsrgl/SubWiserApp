//
//  DetailViewModel.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 10.02.2026.
//
import SwiftUI
import Combine

final class DetailViewModel: ObservableObject {
    
    func sendNotification(subscription: UserSubscription) {
        NotificationManager.shared.scheduleReminder(subscription: subscription)
    }
    
    func requestNotificationPermission() {
        NotificationManager.shared.requestNotificationPermission()
    }
}

