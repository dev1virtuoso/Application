//
//  RhymeBeatApp.swift
//  RhymeBeat
//
//  Created by Carson Wu on 5/28/24.
//

import SwiftUI
import SwiftData
import MediaPlayer

@main
struct RhymeBeatApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
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
    
    init() {
        setupRemoteTransportControls()
    }
    
    func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        
        
        let nowPlayingInfo: [String: Any] = [
            MPMediaItemPropertyTitle: "Title",
            MPMediaItemPropertyArtist: "Artist",
           
        ]
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}
