//
//  ServiceResponse.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 5.02.2026.
//


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
