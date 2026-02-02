//
//  Service.swift.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 2.02.2026.
//

import Foundation

struct SubscriptionService: Identifiable, Decodable {
    let id: String
    let name: String
    let category: String
    let domain: String?
    let image_url: String
    let color: String
}
