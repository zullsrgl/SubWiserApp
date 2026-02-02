//
//  EditView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 1.02.2026.
//

import SwiftUI

struct AddSubscriptionView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .top){
                LazyVStack {
                    ForEach(0..<20){index in
                        SubListCardView()
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
    AddSubscriptionView()
}

