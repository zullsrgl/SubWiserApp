//
//  CloudinaryManager.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 18.02.2026.
//

import Foundation
import Combine

@MainActor
class CloudinaryManager: ObservableObject{
    static let shared = CloudinaryManager()
    let cloudName = "dnjxzc9yy"
    let tagName = "app_icons"
    
    func fetchIcons() async -> [String] {
        guard let url = URL(string: "https://res.cloudinary.com/\(cloudName)/image/list/\(tagName).json")
        else {
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
               let resources = json["resources"] as? [[String: Any]] {
                let icons = resources.compactMap { $0["public_id"] as? String }
                return icons
            }
            
        } catch {
            print("icons fetch error: \(error.localizedDescription)")
        }
        
        return []
    }
    
}
