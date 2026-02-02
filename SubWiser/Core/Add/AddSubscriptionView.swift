//
//  EditView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 1.02.2026.
//

import SwiftUI

struct AddSubscriptionView: View {
    @StateObject private var viewModel = AddSubsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(viewModel.filteredServices) { service in
                    SubListCardView(appIconUrl: service.image_url,
                                    appName: service.name,
                                    appCategory: service.category)
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .navigationTitle("New Subscription")
        .searchable(text: $viewModel.searchText, prompt: "Search subscriptions")
        .onAppear {
            viewModel.loadServices()
        }
    }
}

#Preview {
    AddSubscriptionView()
}

