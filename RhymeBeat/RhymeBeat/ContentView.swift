//
//  ContentView.swift
//  RhymeBeat
//
//  Created by Carson Wu on 5/28/24.
//

import SwiftUI
import UIKit
import MediaPlayer
import AVFoundation
import MobileCoreServices

struct ContentView: View {
    @State private var mp3Files: [URL] = []
    @State private var selectedFolderURL: URL?
    @State private var isMenuActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Select Folder") {
                    showFolderPicker()
                }
                .padding()
                
                if let folderURL = selectedFolderURL {
                    Text("Selected Folder Path: \(folderURL.path)")
                }
                
                List(mp3Files, id: \.self) { fileURL in
                    Button(action: {
                        playAudio(fileURL: fileURL)
                    }) {
                        Text(fileURL.lastPathComponent)
                    }
                }
            }
            .navigationBarTitle("RhymeBeat")
            .navigationBarItems(
                trailing: Button(action: {
                    isMenuActive = true
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                }
            )
            .navigationBarBackButtonHidden(true)
            .onAppear {
                loadMP3Files()
            }
            .sheet(isPresented: $isMenuActive) {
                MenuView()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func playAudio(fileURL: URL) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            let player = AVPlayer(url: fileURL)
            player.play()
            
            let nowPlayingInfo: [String: Any] = [
                MPMediaItemPropertyTitle: fileURL.lastPathComponent,
                MPMediaItemPropertyArtist: "Artist",
            ]
            
            MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
        } catch {
            print("Failed to play audio: \(error)")
        }
    }
    
    func showFolderPicker() {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [String(kUTTypeFolder)], in: .open)
        documentPicker.allowsMultipleSelection = false
        documentPicker.delegate = makeCoordinator()
        UIApplication.shared.windows.first?.rootViewController?.present(documentPicker, animated: true, completion: nil)
    }
    
    func selectFolder(url: URL) {
        selectedFolderURL = url
        loadMP3Files()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let parent: ContentView
        
        init(parent: ContentView) {
            self.parent = parent
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let folderURL = urls.first else { return }
            parent.selectFolder(url: folderURL)
        }
    }
    
    func loadMP3Files() {
        if let folderURL = selectedFolderURL {
            do {
                let fileURLs = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                let mp3URLs = fileURLs.filter { url in
                    let resourceValues = try? url.resourceValues(forKeys: [.isDirectoryKey])
                    return url.pathExtension == "mp3" && !(resourceValues?.isDirectory ?? false)
                }
                mp3Files = mp3URLs
            } catch {
                print("Failed to load MP3 files: \(error)")
            }
        } else {
            mp3Files = []
        }
    }
}
