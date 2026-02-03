//
//  ContentView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 1.02.2026.
//

import SwiftUI

enum Root: Hashable {
    case home
    case detail(ServiceItem)
    case addSubscription
}

struct RootView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            HomeView(path: $path)
                .navigationDestination(for: Root.self) { root in
                    switch root {
                    case .home:
                        HomeView(path: $path)
                    case .detail(let selectedService):
                        SubscriptionDetailView(appInfo: selectedService)
                    case .addSubscription:
                        SubscriptionView(path: $path)
                    }
                }
        }
    }
}

#Preview {
    RootView()
}
