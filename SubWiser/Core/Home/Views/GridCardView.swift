//
//  GridCardView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 2.02.2026.
//

import SwiftUI

struct GridCardView: View {
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color("gray"), lineWidth: 1)
                .frame(width: 160, height: 160)
            
            VStack(alignment:.leading, spacing: 8){
                Image(systemName: "heart")
                    .resizable()
                    .foregroundStyle(Color("gray"))
                    .frame(width: 52, height: 52)
                
                Text("Netflix")
                    .foregroundStyle(Color("gray"))
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                
                Text("$32,04")
                    .foregroundStyle(Color("gray"))
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 8, height: 8)
                        .foregroundStyle(Color("gray"))
                    
                    Text("6 day left")
                        .font(.caption)
                        .foregroundStyle(Color("gray"))
                        .fontWeight(.thin)
                }
                
            }
            .padding(.leading, 16)
        }
    }
}

#Preview {
    GridCardView()
}
