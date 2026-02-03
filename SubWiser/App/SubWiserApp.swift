//
//  SubWiserApp.swift
//  SubWiser
//
//  Created by Zülal Sarıoğlu on 1.02.2026.
//

import SwiftUI
import SwiftData
@main
struct SubWiserApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ServiceItem.self,])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            ServiceItem.loadStaticServices(context: container.mainContext)
            
            return container
        } catch {
            fatalError("SwiftData error: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(sharedModelContainer)
    }
}
