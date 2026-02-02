//
//  ListCardView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 2.02.2026.
//

import SwiftUI

struct ListCardView: View {
    var body: some View {
        VStack {
            Divider()
            HStack {
                Image(systemName: "heart")
                    .resizable()
                    .foregroundStyle(Color("gray"))
                    .frame(width: 52, height: 52)
                
                VStack {
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
                }
                Spacer()
                
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 8, height: 8)
                    .foregroundStyle(Color("gray"))
                
                Text("6 day left")
                    .font(.caption)
                    .foregroundStyle(Color("gray"))
                    .fontWeight(.thin)
                
            }
            .padding(.horizontal, 16)
            Divider()
        }
    }
}

#Preview {
    ListCardView()
}
