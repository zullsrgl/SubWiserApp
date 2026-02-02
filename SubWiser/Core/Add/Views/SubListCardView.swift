//
//  SubListCardView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 2.02.2026.
//

import SwiftUI


struct SubListCardView: View {
    var body: some View {
        HStack {
            Image(systemName: "heart")
                .resizable()
                .frame(width: 60, height: 60)
            
            
            VStack {
                Text("Getir")
                    .foregroundStyle(Color("white"))
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                
                Text("Food")
                    .foregroundStyle(Color("gray"))
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.regular)
                
            }
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 20, height: 30)
        }
        .padding(.horizontal, 16)
    }
}


#Preview {
    SubListCardView()
}
