//
//  AudioViewModel.swift
//  Real-time Audio Waveform Monitor
//
//  Created by Carson Wu on 10/18/25.
//

import Foundation
import SwiftUI
import AudioKit
import AVFoundation

@MainActor
class AudioViewModel: ObservableObject {
    @Published var waveformData: [Float] = []
    @Published var isRecording = false
    @Published var status = "Ready"
    
    private var engine = AudioEngine()
    private var mic: AudioInputNode!
    private var fft: FFT!
    private var timer: Timer?
    
    private let bufferSize = 1024
    private let updateInterval: TimeInterval = 0.03 // ~33fps
    
    init() {
        setupAudio()
        requestPermissions()
    }
    
    private func setupAudio() {
        do {
            // Setup microphone input
            mic = AudioInputNode()
            
            // Setup FFT analysis
            fft = FFT(mic, bufferSize: UInt32(bufferSize))
            fft.fftResolution = .high
            
            engine.output = mic
            try engine.start()
            
            status = "Ready"
        } catch {
            status = "Setup failed: \(error.localizedDescription)"
            print("Audio setup error: \(error)")
        }
    }
    
    private func requestPermissions() {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            DispatchQueue.main.async {
                if granted {
                    self.status = "Authorized"
                } else {
                    self.status = "Microphone permission required"
                }
            }
        }
    }
    
    func startRecording() {
        guard !isRecording else { return }
        
        isRecording = true
        status = "Listening..."
        
        // Start periodic waveform updates
        timer = Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { _ in
            self.updateWaveform()
        }
    }
    
    func stopRecording() {
        isRecording = false
        status = "Stopped"
        timer?.invalidate()
        timer = nil
        waveformData = []
    }
    
    private func updateWaveform() {
        guard let fftData = fft.fftData else { return }
        
        // Convert FFT data to waveform samples
        let magnitudeData = fftData.enumerated().compactMap { index, value -> Float? in
            // Take only first half of frequencies (symmetric)
            guard index < bufferSize / 2 else { return nil }
            
            // Calculate magnitude
            let real = Float(value.real)
            let imag = Float(value.imaginary)
            let magnitude = sqrt(real * real + imag * imag)
            
            // Log scaling for better visual effect
            return magnitude > 0.001 ? 20 * log10(magnitude) : -60
        }
        
        // Simplify data points
        let targetPoints = 200
        let step = max(1, magnitudeData.count / targetPoints)
        waveformData = stride(from: 0, to: magnitudeData.count, by: step)
            .map { magnitudeData[$0] }
            .map { max(-1, min(1, $0 / 20.0)) } // Normalize to [-1, 1]
    }
    
    deinit {
        timer?.invalidate()
        try? engine.stop()
    }
}
