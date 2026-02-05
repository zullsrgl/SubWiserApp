//
//  SubListCardView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 2.02.2026.
//

import SwiftUI


struct SearchCardView: View {
    var appIconUrl: String
    var appName: String
    var appCategory: String
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: appIconUrl)) { phase in
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
            
            VStack(alignment: .leading){
                Text(appName)
                    .foregroundStyle(Color("white"))
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                
                Text(appCategory)
                    .foregroundStyle(Color("gray"))
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.regular)
                
            }
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .foregroundStyle(Color("white"))
                .frame(width: 10, height: 20)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    SearchCardView(appIconUrl: "", appName: "", appCategory: "")
}
