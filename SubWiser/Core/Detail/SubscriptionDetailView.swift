//
//  SubscriptionDetailView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 1.02.2026.
//

import SwiftUI



struct SubscriptionDetailView: View {
    
    let appInfo: ServiceItem
    @State private var startDate = Date()
    @State private var selectedSegment: BillingCycle = .monthly
    @State private var reminderIsOn: Bool = false
    @State private var currency: Currency = .tr
    @State private var category: ServiceCategory = .entertainment
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .resizable()
                            .foregroundStyle(Color("white"))
                            .frame(width: 30, height: 30)
                        
                        Text("Currency")
                            .foregroundStyle(Color("white"))
                        Spacer()
                        
                        Picker("", selection: $currency) {
                            ForEach(Currency.allCases, id: \.self){ segment in
                                Text(segment.rawValue.capitalized)
                                    .foregroundStyle(Color("white"))
                            }
                            
                            .pickerStyle(.segmented)
                        }
                        .labelsHidden()
                        .datePickerStyle(.compact)
                        .colorScheme(.dark)
                        .tint(Color("white"))
                    }
                    HStack {
                        Image(systemName: "square.on.circle")
                            .resizable()
                            .foregroundStyle(Color("white"))
                            .frame(width: 30, height: 30)
                        
                        Text("Category")
                            .foregroundStyle(Color("white"))
                        Spacer()
                        
                        Picker("", selection: $category) {
                            ForEach(ServiceCategory.allCases, id: \.self){ segment in
                                Text(segment.rawValue.capitalized)
                                    .foregroundStyle(Color("white"))
                            }
                            
                            .pickerStyle(.segmented)
                        }
                        .labelsHidden()
                        .datePickerStyle(.compact)
                        .colorScheme(.dark)
                        .tint(Color("white"))
                    }
                }
                .listRowBackground(Color("primary"))
                
                Section {
                    HStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .foregroundStyle(Color("white"))
                            .frame(width: 30, height: 30)
                        
                        Text("Start Date")
                            .foregroundStyle(Color("white"))
                        Spacer()
                        DatePicker("", selection: $startDate, displayedComponents: .date)
                        
                            .labelsHidden()
                            .colorScheme(.dark)
                            .tint(Color("white"))
                    }
                    HStack {
                        Image(systemName: "arrow.2.squarepath")
                            .resizable()
                            .foregroundStyle(Color("white"))
                            .frame(width: 30, height: 24)
                        
                        Text("Billing Cycle")
                            .foregroundStyle(Color("white"))
                        Spacer()
                        
                        Picker("", selection: $selectedSegment) {
                            ForEach(BillingCycle.allCases, id: \.self){ segment in
                                Text(segment.rawValue.capitalized)
                                    .foregroundStyle(Color("white"))
                            }
                            
                            .pickerStyle(.segmented)
                        }
                        .labelsHidden()
                        .colorScheme(.dark)
                        .tint(Color("white"))
                        
                    }
                }
                .listRowBackground(Color("primary"))
                
                Section {
                    HStack {
                        Text("Reminder")
                            .foregroundStyle(Color("white"))
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Toggle("", isOn: $reminderIsOn)
                            .labelsHidden()
                            .tint(Color("green"))
                    }
                }
                .listRowBackground(Color("primary"))
                
            }
            .scrollContentBackground(.hidden)
            .background(Color("background"))
        }
        .navigationTitle("Edit")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // TODO: save new sub
                } label: {
                    Image(systemName: "checkmark")
                        .resizable()
                        .foregroundStyle(Color("white"))
                }
            }
        }
    }
}

#Preview {
    SubscriptionDetailView(appInfo: ServiceItem(id: "", name: "", category: "", domain: "", imageUrl: "", hexColor: ""))
}
