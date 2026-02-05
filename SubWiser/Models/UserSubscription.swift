//
//  UserSubscription.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 5.02.2026.
//
import SwiftData
import Foundation

@Model
final class UserSubscription {
    @Attribute(.unique) var id: String
    var price: Double
    var currency: String
    var category: String
    var date: Date
    var billingCycle: String
    var reminder: Bool?
    
    @Relationship(deleteRule: .nullify)
    var service: ServiceItem?
    
    init(id: String = UUID().uuidString, price: Double, currency: String, category: String, date: Date, billingCycle: String, reminder: Bool? = nil, service: ServiceItem? = nil) {
        self.id = id
        self.price = price
        self.currency = currency
        self.category = category
        self.date = date
        self.billingCycle = billingCycle
        self.reminder = reminder
        self.service = service
    }
}
