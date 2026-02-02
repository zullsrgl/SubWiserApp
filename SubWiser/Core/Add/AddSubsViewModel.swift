//
//  DetailViewModel.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 2.02.2026.
//

import Foundation
import Combine

final class AddSubsViewModel: ObservableObject {
    @Published var data: [SubscriptionService] = []
    @Published var searchText = ""
    
    var filteredServices: [SubscriptionService] {
            if searchText.isEmpty {
                return data
            } else {
                return data.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
        }

    func loadServices() {
        guard let url = Bundle.main.url(forResource: "services", withExtension: "json") else {
            return
        }

        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decoded = try decoder.decode([SubscriptionService].self, from: jsonData)
            self.data = decoded
        } catch {
            self.data = []
        }
    }
}
