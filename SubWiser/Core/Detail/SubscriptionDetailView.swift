//
//  SubscriptionDetailView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 1.02.2026.
//

import SwiftUI
import SwiftData

struct SubscriptionDetailView: View {
    
    let appInfo: ServiceItem?
    @State private var startDate = Date()
    @State private var selectedSegment: BillingCycle = .monthly
    @State private var reminderIsOn: Bool = false
    @State private var currency: Currency = .tr
    @State private var category: ServiceCategory = .entertainment
    @State private var price: Double = 0.0
    @StateObject private var viewModel = DetailViewModel()
    @State private var isShowSheet = false
    
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form{
                Section {
                    DetailCardView(
                        imageUrl: viewModel.selectedIconPath != nil
                        ? "https://res.cloudinary.com/dnjxzc9yy/image/upload/f_auto,q_auto,w_150/\(viewModel.selectedIconPath!)"
                        : (appInfo?.imageUrl ?? ""),
                        price: $price,
                        currency: $currency,
                        appName: appInfo?.name ?? "App Name",
                        sheetOnClick: {
                            isShowSheet = true
                        })
                }
                .listRowBackground(Color("primary"))
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                
                Section {
                    HStack{
                        Image(systemName: "dollarsign.circle")
                            .resizable()
                            .foregroundStyle(Color("white"))
                            .frame(width: 24, height: 24)
                        
                        Text("Currency")
                            .foregroundStyle(Color("white"))
                            .font(.custom("", size: 16))
                        Spacer()
                        
                        Picker("", selection: $currency) {
                            ForEach(Currency.allCases, id: \.self){ item in
                                Text("\(item.symbol)").tag(item)
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
                            .frame(width: 24, height: 24)
                        
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
                        .datePickerStyle(.graphical)
                        .colorScheme(.dark)
                        .tint(Color("white"))
                    }
                }
                .listRowBackground(Color("primary"))
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                
                Section {
                    HStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .foregroundStyle(Color("white"))
                            .frame(width: 24, height: 24)
                        
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
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                        
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
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                
                Section {
                    HStack {
                        Text("Reminder")
                            .foregroundStyle(Color("white"))
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Toggle("", isOn: $reminderIsOn)
                            .labelsHidden()
                            .tint(Color("green"))
                            .onChange(of: reminderIsOn) { oldValue, newValue in
                                viewModel.requestNotificationPermission()
                            }
                    }
                }
                .listRowBackground(Color("primary"))
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                
            }
            .scrollContentBackground(.hidden)
        }
        .background(Color("background"))
        .navigationTitle(appInfo?.name ?? "")
        .foregroundStyle(Color("white"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    let newSubscription = UserSubscription(
                        price: Double(price),
                        currency: currency.rawValue,
                        category: category.rawValue,
                        date: startDate,
                        billingCycle: selectedSegment.rawValue,
                        reminder: reminderIsOn,
                        service: appInfo
                    )
                    
                    modelContext.insert(newSubscription)
                    
                    do {
                        try modelContext.save()
                        
                        if reminderIsOn {
                            viewModel.sendNotification(subscription: newSubscription)
                        }
                        dismiss()
                    } catch {
                        print("error:: \(error)")
                    }
                } label: {
                    Image(systemName: "checkmark")
                        .resizable()
                        .foregroundStyle(Color("white"))
                }
            }
        }
        .sheet(isPresented: $isShowSheet) {
            IconPickerSheetView(
                icons: viewModel.icons,
                selectedIcon: $viewModel.selectedIconPath
            )
        }
        .task {
            await viewModel.fetchIcons()
        }
    }
}

#Preview {
    SubscriptionDetailView(appInfo: ServiceItem(id: "", name: "", category: "", domain: "", imageUrl: "", hexColor: ""))
}
