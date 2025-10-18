//
//  ContentView.swift
//  Real-time Audio Waveform Monitor
//
//  Created by Carson Wu on 10/18/25.
//

import SwiftUI
import AudioKit

struct ContentView: View {
    @StateObject private var audioViewModel = AudioViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Real-time Audio Waveform")
                .font(.title)
                .padding()
            
            WaveformView(waveformData: audioViewModel.waveformData)
                .frame(height: 200)
                .border(Color.gray, width: 1)
            
            HStack {
                Button(action: {
                    audioViewModel.startRecording()
                }) {
                    Text("Start Listening")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    audioViewModel.stopRecording()
                }) {
                    Text("Stop Listening")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            
            Text("Status: \(audioViewModel.status)")
                .foregroundColor(audioViewModel.isRecording ? .green : .red)
        }
        .padding()
        .frame(minWidth: 600, minHeight: 400)
    }
}
