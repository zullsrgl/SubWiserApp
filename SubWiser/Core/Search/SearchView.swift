//
//  SubscriptionView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 1.02.2026.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @Query(sort: \ServiceItem.name) private var allServices: [ServiceItem]
    @Environment(\.modelContext) private var modelContext
    
    @State private var searchText = ""
    @Binding var path: NavigationPath
    
    var filteredServices: [ServiceItem]{
        if searchText.isEmpty {
            return allServices
        }else {
            return allServices.filter {
                $0.name.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(filteredServices) { service in
                    SearchCardView(appIconUrl: service.imageUrl,
                                    appName: service.name,
                                    appCategory: service.category)
                    .onTapGesture {
                        path.append(Root.detail(service))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .navigationTitle("New Subscription")
        .searchable(text: $searchText, prompt: "Search subscriptions")
        
    }
}

#Preview {
    SearchView(path: .constant(NavigationPath()))
}

