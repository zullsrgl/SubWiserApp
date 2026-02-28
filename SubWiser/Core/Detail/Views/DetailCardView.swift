//
//  DetailCardView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 25.02.2026.
//

import SwiftUI

struct DetailCardView: View {
    let imageUrl: String
    @Binding var price: Double
    @Binding var currency: Currency
    @State var appName: String
    var sheetOnClick: () -> Void
    var body: some View {
        HStack(spacing: 20) {
            ZStack(alignment: .bottomTrailing) {
                Group {
                    if !imageUrl.isEmpty {
                        AsyncImage(url: URL(string: imageUrl)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 85, height: 85)
                                
                            case .success(let image):
                                image.resizable().scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 40))
                            case .failure:
                                Image(systemName: "photo").foregroundStyle(.secondary)
                                    .frame(width: 85, height: 85)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else {
                        Image(systemName: "photo.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color("white").opacity(0.7))
                            .frame(width: 80, height: 80)
                    }
                }
                Image(systemName: "plus")
                    .foregroundStyle(Color("primary"))
                    .frame(width: 28, height: 28)
                    .background(Circle().fill(Color("white")))
                    .shadow(radius: 2)
            }
            .onTapGesture {
                sheetOnClick()
            }
            
            VStack(spacing: 12) {
                TextField("Örn: Netflix, Spotify", text: $appName)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .padding(.horizontal, 16)
                    .frame(height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("white").opacity(0.5))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("primary").opacity(0.1), lineWidth: 1)
                    )
                
                HStack {
                    Text(currency.rawValue)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    
                    TextField("0.00", value: $price, format: .number)
                        .keyboardType(.decimalPad)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 16)
                .frame(height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("white").opacity(0.5))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("primary").opacity(0.2), lineWidth: 1)
                )
            }
        }
    }
}
#Preview {
    DetailCardView(imageUrl: "", price: .constant(12.4), currency: .constant(.tr), appName: "", sheetOnClick:{})
}
