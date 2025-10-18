//
//  WaveformView.swift.swift
//  Real-time Audio Waveform Monitor
//
//  Created by Carson Wu on 10/18/25.
//

import SwiftUI

struct WaveformView: View {
    let waveformData: [Float]
    private let lineWidth: CGFloat = 1.0
    private let maxHeight: CGFloat = 180
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background grid
                Path { path in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    
                    // Vertical lines
                    for x in stride(from: 0, to: width, by: 50) {
                        path.move(to: CGPoint(x: x, y: 0))
                        path.addLine(to: CGPoint(x: x, y: height))
                    }
                    
                    // Horizontal center line
                    path.move(to: CGPoint(x: 0, y: height / 2))
                    path.addLine(to: CGPoint(x: width, y: height / 2))
                }
                .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
                
                // Waveform
                if !waveformData.isEmpty {
                    WaveformPath(waveformData: waveformData, size: geometry.size)
                }
            }
        }
    }
}

struct WaveformPath: View {
    let waveformData: [Float]
    let size: CGSize
    
    var body: some View {
        Path { path in
            let width = size.width
            let height = size.height
            let centerY = height / 2
            
            guard !waveformData.isEmpty else { return }
            
            let pointSpacing = width / CGFloat(waveformData.count - 1)
            
            for (index, sample) in waveformData.enumerated() {
                let x = CGFloat(index) * pointSpacing
                let normalizedSample = CGFloat(sample)
                let y = centerY - normalizedSample * (height * 0.4)
                
                if index == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
        }
        .stroke(Color.blue, lineWidth: 2)
    }
}
