//
//  SubsView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 1.02.2026.
//

import SwiftUI

struct SubsView: View {
    @State private var isGrid = true
    @State var subscription: [UserSubscription]
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack{
                Text("Your Subscripton")
                    .font(.title3)
                    .foregroundStyle(Color("slatGray"))
                    .fontWeight(.semibold)
                
                Spacer()
                Button {
                   isGrid = true
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .frame(width: 30, height: 30)
                            .foregroundStyle(isGrid ? Color("secondery") : Color("slatGray"))
                        
                        Image(systemName: "square.grid.2x2.fill")
                            .resizable()
                            .foregroundStyle(Color("white"))
                            .frame(width: 20, height: 20)
                    }
                    
                }
                .padding(.trailing, 16)
                Button {
                    isGrid = false
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .frame(width: 30, height: 30)
                            .foregroundStyle(!isGrid ? Color("secondery") : Color("slatGray"))
                        
                        Image(systemName: "list.bullet")
                            .resizable()
                            .foregroundStyle(Color("white"))
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .padding(.horizontal, 16)
            
            if isGrid  {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(subscription) { index in
                        GridCardView(subscription: index)
                    }
                }
                
            }else {
                LazyVStack {
                    ForEach(subscription){ index in
                        ListCardView(subscription: index)
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    SubsView(subscription: [UserSubscription(price: 0.0, currency: "", category: "", date: Date(), billingCycle: "")])
}




