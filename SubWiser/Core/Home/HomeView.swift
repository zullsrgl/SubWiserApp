//
//  HomeView.swift
//  SubWiser
//
//  Created Zülal Sarıoğlu on 1.02.2026.
//
import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var isGrid: Bool = false
    @State private var selectedSegment: BillingCycle = .monthly
    @Binding var path: NavigationPath
    @Query private var subscriptions: [UserSubscription]
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 24){
                    Text("Total Spending")
                        .font(.headline)
                        .foregroundStyle(Color("slatGray"))
                        .padding(.horizontal, 16)
                    
                    HStack {
                        Text("$234,32")
                            .font(.largeTitle)
                            .foregroundStyle(Color("white"))
                        
                        Picker("", selection: $selectedSegment) {
                            ForEach(BillingCycle.allCases, id: \.self){ segment in
                                Text(segment.rawValue.capitalized)
                                    .foregroundStyle(Color("white"))
                            }
                            
                            .pickerStyle(.segmented)
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    ChartView()
                    SubsView(subscription: subscriptions)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        path.append(Root.addSubscription)
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundStyle(Color("white"))
                    }
                }
            }
        }
        .background(Color("background"))
    }
}

#Preview {
    HomeView(path: .constant(NavigationPath()))
   
}
