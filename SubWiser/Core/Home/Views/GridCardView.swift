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
                .frame(width: 160, height: 160)
            
            VStack(alignment:.leading, spacing: 8){
                HStack {
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
                    
                    Text(subscription.category)
                        .foregroundStyle(Color("white"))
                        .font(.custom("", size: 12))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background {
                            RoundedRectangle(cornerRadius: 4, style: .circular)
                                .fill(Color(hex: subscription.service?.hexColor ?? "").opacity(0.5))
                        }
                }
                
                Text(subscription.service?.name ?? "?")
                    .foregroundStyle(Color("primary"))
                    .font(.custom("", size: 14))
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .frame(width: 160, alignment: .leading)
                
                Text("\(String(subscription.price)) \(subscription.currencySymbol)")
                    .foregroundStyle(Color("white"))
                    .font(.custom("", size:14))
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 8, height: 8)
                        .foregroundStyle(Color(hex: subscription.service?.hexColor ?? ""))
                    
                    Text("6 day left")
                        .font(.caption)
                        .foregroundStyle(Color("slatGray"))
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

extension UserSubscription {
    var currencySymbol: String {
        return Currency(rawValue: self.currency)?.symbol ?? self.currency
    }
}

#Preview {
    GridCardView(subscription: UserSubscription(price: 0.0, currency: "", category: "", date: Date(), billingCycle: ""))
}
