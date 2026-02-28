//
//  DetailViewModel.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 10.02.2026.
//
import SwiftUI
import Combine

final class DetailViewModel: ObservableObject {
    @Published var selectedIconPath: String? = nil
    @Published var icons: [String] = []
  
    func fetchIcons() async {
        self.icons =  await CloudinaryManager.shared.fetchIcons()
        
    }
    
    func sendNotification(subscription: UserSubscription) {
        NotificationManager.shared.scheduleReminder(subscription: subscription)
    }
    
    func requestNotificationPermission() {
        NotificationManager.shared.requestNotificationPermission()
    }
}

