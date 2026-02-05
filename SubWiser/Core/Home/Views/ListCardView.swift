//
//  ListCardView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 2.02.2026.
//

import SwiftUI

struct ListCardView: View {
    
    @State var subscription: UserSubscription
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("gray"), lineWidth: 1)
                .frame(height: 80)
                .padding(.horizontal)
            
            VStack {
                HStack {
                    AsyncImage(url: URL(string: subscription.service?.imageUrl ?? "https://www.google.com/s2/favicons?sz=128&domain=netflix.com")) { phase in
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
                    .padding(.leading, 8)
                    
                    VStack(alignment: .leading){
                        Text(subscription.service?.name ?? "?")
                            .foregroundStyle(Color("primary"))
                            .font(.headline)
                            .font(.custom("", size:14))
                            .multilineTextAlignment(.leading)
                            .fontWeight(.semibold)
                        
                        Text("\(String(subscription.price)) \(subscription.currencySymbol)")
                            .foregroundStyle(Color("white"))
                            .font(.custom("", size:14))
                            .multilineTextAlignment(.leading)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    
                    VStack {
                        Text(subscription.category)
                            .foregroundStyle(Color("white"))
                            .font(.custom("", size: 12))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background {
                                RoundedRectangle(cornerRadius: 4, style: .circular)
                                    .fill(Color(hex: subscription.service?.hexColor ?? "").opacity(0.5))
                            }
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 8, height: 8)
                                .foregroundStyle(Color(hex: subscription.service?.hexColor ?? ""))
                            
                            Text("6 day left")
                                .font(.caption)
                                .foregroundStyle(Color("gray"))
                                .fontWeight(.thin)
                        }
                    }
                    .padding(.trailing, 8)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    ListCardView(subscription: UserSubscription(id: "", price: 0.0, currency: "", category: "", date: Date(), billingCycle: "", reminder: true, service: nil))
}
