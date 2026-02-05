//
//  GridCardView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 2.02.2026.
//

import SwiftUI

struct GridCardView: View {
    
    @State var subscription: UserSubscription
    
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("gray"), lineWidth: 1)
                .frame(width: 160, height: 180)
            
            VStack(alignment:.leading, spacing: 8){
                AsyncImage(url: URL(string: subscription.service?.imageUrl ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 40, height: 40)
                            
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                    case .failure:
                        Image(systemName: "questionmark.app.dashed")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            
                    @unknown default:
                        EmptyView()
                    }
                }
                
                Text(subscription.service?.name ?? "?")
                    .foregroundStyle(Color("primary"))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .frame(width: 160, alignment: .leading)
                
                Text(String(subscription.price))
                    .foregroundStyle(Color("white"))
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 8, height: 8)
                        .foregroundStyle(Color("primary"))
                    
                    Text("6 day left")
                        .font(.caption)
                        .foregroundStyle(Color("gray"))
                        .fontWeight(.thin)
                }
                
            }
            .padding(.leading, 16)
            .onAppear{
                print("subs price: \(subscription.price)")
            }
        }
    }
}

#Preview {
    GridCardView(subscription: UserSubscription(price: 0.0, currency: "", category: "", date: Date(), billingCycle: ""))
}
