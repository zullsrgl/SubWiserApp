//
//  IconPickerSheetView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 25.02.2026.
//

import SwiftUI

struct IconPickerSheetView: View {
    let icons: [String]
    @Binding var selectedIcon: String?
    @Environment(\.dismiss) var dismiss
    
    let columns = [
        GridItem(.adaptive(minimum: 75), spacing: 20)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 25) {
                    ForEach(icons, id: \.self) { iconPath in
                        Button {
                            selectedIcon = iconPath
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            dismiss()
                        } label: {
                            iconCircle(path: iconPath)
                           
                        }
                    }
                }
                .padding(25)
            }
        }
    }
    
    private func iconCircle(path: String) -> some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.06))
                .frame(width: 75, height: 75)
                .overlay(Circle().stroke(Color.white.opacity(0.1), lineWidth: 1))
            
            AsyncImage(
                url: URL(string:
                    "https://res.cloudinary.com/dnjxzc9yy/image/upload/f_auto,q_auto,w_150/\(path)"
                )
            ) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView().scaleEffect(0.8)
            }
            .frame(width: 45, height: 45)
        }
    }
}

#Preview {
    IconPickerSheetView(icons: [], selectedIcon: .constant(""))
}
