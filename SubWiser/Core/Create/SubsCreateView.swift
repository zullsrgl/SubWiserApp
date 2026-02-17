//
//  SubsCreateView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 16.02.2026.
//

import SwiftUI

struct SubsCreateView: View {
    @State private var subsName: String = ""
    @State private var subsCategory: String = ""
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                ZStack(alignment: .bottomTrailing){
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .padding(6)
                        .frame(width: 80, height: 80)
                        .background(
                            Circle()
                                .fill(Color.gray)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.secondary, lineWidth: 1)
                        )
                        .padding(.bottom, 20)
                    
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundStyle(Color("white"))
                        .padding(.all, 2)
                        .frame(width: 24, height: 24)
                        .background(
                            Circle()
                                .fill(Color("primary"))
                        )
                        .padding(.bottom, 16)
                        .padding(.trailing, 6)
                }
            
                TextField("App Name", text: $subsName)
                    .padding(.horizontal, 12)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.clear)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("gray"), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                TextField("App Category", text: $subsCategory)
                    .padding(.horizontal, 12)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.clear)
                        
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("gray"), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                Button {
                    
                    
                } label: {
                    Text("Save")
                        .foregroundStyle(Color("white"))
                        .fontWeight(.bold)
                        .padding(.horizontal, 12)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color("primary").opacity(0.5))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("primary").opacity(0.5), lineWidth: 1)
                        )
                        .padding(.horizontal)
                }
            }
            .padding(.top, 40)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .navigationTitle("Create Subscription")
    }
}

#Preview {
    SubsCreateView()
}
