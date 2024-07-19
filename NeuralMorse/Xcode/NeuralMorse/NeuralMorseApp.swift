//
//  NeuralMorseApp.swift
//  NeuralMorse
//
//  Created by Carson Wu on 5/9/24.
//

import SwiftUI
import SwiftData

@main
struct NeuralMorseApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            if #available(iOS 17, *) {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } else {
            }
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
