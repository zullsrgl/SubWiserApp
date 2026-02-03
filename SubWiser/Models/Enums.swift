//
//  Enums.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 3.02.2026.
//
enum Currency: String, CaseIterable, Identifiable {
    case usd = "USD"
    case tr = "TR"
    case eur = "EUR"
    case azn = "AZN"
    case rub = "RUB"
    case jpy = "JPY"
    
    var id: String { self.rawValue }
    
    var symbol: String {
        switch self {
        case .usd: return "$"
        case .tr: return "₺"
        case .eur: return "€"
        case .azn: return "₼"
        case .rub: return "₽"
        case .jpy: return "¥"
        }
    }
}

enum ServiceCategory: String, CaseIterable, Identifiable {
    case entertainment = "Entertainment"
    case music = "Music"
    case shopping = "Shopping"
    case education = "Education"
    case productivity = "Productivity"
    case finance = "Finance"
    case health = "Health"
    case other = "Other"
    
    var id: String { self.rawValue }
    
    var iconName: String {
        switch self {
        case .entertainment: return "play.tv.fill"
        case .music: return "music.note"
        case .shopping: return "cart.fill"
        case .education: return "book.fill"
        case .productivity: return "calendar.badge.checkmark"
        case .finance: return "creditcard.fill"
        case .health: return "heart.fill"
        case .other: return "ellipsis.circle.fill"
        }
    }
}


enum BillingCycle: String, CaseIterable {
    case weakly = "Weakly"
    case monthly = "Monthly"
    case yearly = "Yearly"
}

