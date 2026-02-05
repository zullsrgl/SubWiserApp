//
//  Service.swift.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 2.02.2026.
//

import Foundation
import SwiftData

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

@Model
final class ServiceItem {
    @Attribute(.unique) var id: String
    var name: String
    var category: String
    var domain: String
    var imageUrl: String
    var hexColor: String
    
    init(id: String, name: String, category: String, domain: String, imageUrl: String, hexColor: String) {
        self.id = id
        self.name = name
        self.category = category
        self.domain = domain
        self.imageUrl = imageUrl
        self.hexColor = hexColor
    }
    static func loadStaticServices(context: ModelContext) {
        let descriptor = FetchDescriptor<ServiceItem>()
        let existingCount = (try? context.fetchCount(descriptor)) ?? 0
        
        if existingCount > 0 { return }
        guard let url = Bundle.main.url(forResource: "services", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("JSON file not found!")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(ServiceResponse.self, from: data)
            
            for item in response.services {
                let newService = ServiceItem(
                    id: item.id,
                    name: item.name,
                    category: item.category,
                    domain: item.domain,
                    imageUrl: item.imageUrl,
                    hexColor: item.color
                )
                context.insert(newService)
            }
            
            try context.save()
        } catch {
            print("JSON Decode error: \(error)")
        }
    }
}


struct ServiceResponse: Codable {
    let services: [ServiceJSONModel]
}

struct ServiceJSONModel: Codable {
    let id: String
    let name: String
    let category: String
    let domain: String
    let imageUrl: String
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, category, domain, color
        case imageUrl = "image_url"
    }
}
