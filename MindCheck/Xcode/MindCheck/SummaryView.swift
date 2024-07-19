//
//  SummaryView.swift
//  MindCheck
//
//  Created by Carson Wu on 5/18/24.
//

import SwiftUI

struct SummaryView: View {
    @State private var totalEntries: Int = 0
    @State private var date: String = ""
    @State private var scores: [Double] = [0, 0, 0, 0, 0]

    var body: some View {
        VStack {
            Text("Total entries: \(totalEntries)")
            Text("Date: \(date)")

            GeometryReader { geometry in
                Path { path in
                    let minY = scores.min() ?? 0
                    let maxY = scores.max() ?? 100

                    let xScale = geometry.size.width / CGFloat(scores.count - 1)
                    let yScale = geometry.size.height / CGFloat(maxY - minY)

                    for (index, score) in scores.enumerated() {
                        let x = CGFloat(index) * xScale
                        let y = (CGFloat(score) - CGFloat(minY)) * yScale

                        if index == 0 {
                            path.move(to: CGPoint(x: x, y: y))
                        } else {
                            path.addLine(to: CGPoint(x: x, y: y))
                        }
                    }
                }
                .stroke(Color.blue, lineWidth: 2)
            }
            .frame(height: 200)
            .padding()
        }
        .onAppear {
            loadScoresFromLocal()
        }
    }

    private func loadScoresFromLocal() {
        let defaults = UserDefaults.standard

        if let totalEntries = defaults.value(forKey: "TotalEntries") as? Int {
            self.totalEntries = totalEntries
        }

        if let date = defaults.value(forKey: "Date") as? String {
            self.date = date
        }
        
        if let scoresData = defaults.array(forKey: "ScoresData") as? [Double] {
            self.scores = scoresData
        }
    }
}

#Preview {
    SummaryView()
}
