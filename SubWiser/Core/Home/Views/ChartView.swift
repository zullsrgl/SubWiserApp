//
//  ChartView.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 1.02.2026.
//

import SwiftUI
import Charts

struct Expense: Identifiable {
    let id = UUID()
    let month: String
    let amount: Double
}

struct ChartView: View {
    
    let data = [
        Expense(month: "Jan", amount: 120),
        Expense(month: "Feb", amount: 80),
        Expense(month: "Mar", amount: 150),
        Expense(month: "April", amount: 70),
        Expense(month: "May", amount: 10),
        Expense(month: "June", amount: 130),
        Expense(month: "July", amount: 40),
        Expense(month: "Sept", amount: 140),
        Expense(month: "Oct", amount: 90),
        Expense(month: "Nav", amount: 60),
        Expense(month: "Des", amount: 120)
   ]
    
    var body: some View {
        Chart(data) {
            LineMark(
                x: .value("Month", $0.month),
                y: .value("Amount", $0.amount)
            )
        }
        
        .frame(height: 200)
        .padding(.horizontal, 16)
    }
}

#Preview {
    ChartView()
}
