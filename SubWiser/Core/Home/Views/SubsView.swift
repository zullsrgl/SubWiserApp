//
//  SubsView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 1.02.2026.
//

import SwiftUI
import SwiftData

struct SubsView: View {
    @State private var itemToDelete: UserSubscription?
    @State private var isGrid = true
    @State private var isLongPress = false
    @Environment(\.modelContext) private var modelContext
    
    var subOnClicked: (ServiceItem) -> Void
    
    var subscription: [UserSubscription]
    let columns = [
        GridItem(.flexible(), spacing: 24),
        GridItem(.flexible(), spacing: 24)
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
            
            if isGrid  {
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(subscription) { index in
                        GridCardView(subscription: index)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                subOnClicked(index.service ?? ServiceItem(id: "", name: "", category: "", domain: "", imageUrl: "", hexColor: ""))
                            }
                            .contextMenu{
                                Button(role: .destructive) {
                                    deleteSubs(item: index)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        
                    }
                }
                
            }else {
                LazyVStack {
                    ForEach(subscription){ index in
                        ListCardView(subscription: index)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                subOnClicked(index.service ?? ServiceItem(id: "", name: "", category: "", domain: "", imageUrl: "", hexColor: ""))
                            }
                            .contextMenu{
                                Button(role: .destructive) {
                                    deleteSubs(item: index)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        
                    }
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    private func deleteSubs(item: UserSubscription){
        modelContext.delete(item)
        do {
            try modelContext.save()
        }catch {
            print("dele error: \(error.localizedDescription)")
        }
        
    }
}

#Preview {
    SubsView(subOnClicked: {_ in }, subscription: [UserSubscription(price: 0.0, currency: "", category: "", date: Date(), billingCycle: "")])
}




