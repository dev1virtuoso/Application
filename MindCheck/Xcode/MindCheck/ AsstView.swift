//
//  AsstView.swift
//  MindCheck
//
//  Created by Carson Wu on 5/12/24.
//

import SwiftUI

struct ScoreResult: Codable {
    let score: Int
    let riskLevel: String
}

struct AsstView: View {
    @State private var gad7Responses: [Int] = Array(repeating: 0, count: 7)
    @State private var phq9Responses: [Int] = Array(repeating: 0, count: 9)
    @State private var isSubmitted = false
    @State private var gad7Score: ScoreResult = ScoreResult(score: 0, riskLevel: "")
    @State private var phq9Score: ScoreResult = ScoreResult(score: 0, riskLevel: "")
    @State private var entries: [Entry] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("GAD-7")
                    .font(.title)
                    .padding()
                
                ForEach(0..<7) { index in
                    MultipleChoiceQuestionView(question: gad7Questions[index], response: $gad7Responses[index])
                }
                
                Text("PHQ-9")
                    .font(.title)
                    .padding()
                
                ForEach(0..<9) { index in
                    MultipleChoiceQuestionView(question: phq9Questions[index], response: $phq9Responses[index])
                }
                
                Button(action: {
                    submitResponses()
                    saveScoresToLocal()
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                if isSubmitted {
                    VStack(alignment: .leading) {
                        Text("The Score of depression and anxiety risk:")
                        Text("Anxiety Score (GAD-7): \(gad7Score.score)")
                        Text("Anxiety Risk Level (GAD-7): \(gad7Score.riskLevel)")
                        Text("Depression Score (PHQ-9): \(phq9Score.score)")
                        Text("Depression Risk Level (PHQ-9): \(phq9Score.riskLevel)")
                    }
                    .font(.headline)
                    .padding()
                }
            }
            .padding()
        }
    }
    
    private func saveScoresToLocal() {
        let entry = Entry(gad7Score: gad7Score, phq9Score: phq9Score)
        entries.append(entry)
        
        let defaults = UserDefaults.standard
        let encodedEntries = try? JSONEncoder().encode(entries)
        defaults.set(encodedEntries, forKey: "Entries")
    }
    
    private func submitResponses() {
        let gad7TotalScore = gad7Responses.reduce(0, +)
        let phq9TotalScore = phq9Responses.reduce(0, +)
        
        gad7Score = getScoreResult(score: gad7TotalScore)
        phq9Score = getScoreResult(score: phq9TotalScore)
        
        isSubmitted = true
    }
    
    private func getScoreResult(score: Int) -> ScoreResult {
        switch score {
        case 0...4:
            return ScoreResult(score: score, riskLevel: "Minimal Risk")
        case 5...9:
            return ScoreResult(score: score, riskLevel: "Mild Risk")
        case 10...14:
            return ScoreResult(score: score, riskLevel: "Moderate Risk")
        case 15...19:
            return ScoreResult(score: score, riskLevel: "Moderate to Severe Risk")
        default:
            return ScoreResult(score: score, riskLevel: "Severe Risk")
        }
    }
}

struct MultipleChoiceQuestionView: View {
    let question: String
    @Binding var response: Int
    
    private let options = ["Not at all", "Several days", "More than half the days", "Nearly every day"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question)
                .font(.headline)
            
            ForEach(0..<options.count) { index in
                Button(action: {
                    response = index
                }) {
                    HStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(response == index ? Color.blue : Color.gray)
                        
                        Text(options[index])
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .padding()
    }
}

struct Entry: Codable {
    let gad7Score: ScoreResult
    let phq9Score: ScoreResult
}

let gad7Questions = [
    "Feeling nervous, anxious or on edge",
    "Not being able to stop or control worrying",
    "Worrying too much about different things",
    "Trouble relaxing",
    "Being so restless that it is hard to sit still",
    "Becoming easily annoyed or irritable",
    "Feeling afraid as if something awful might happen"
]

let phq9Questions = [
    "Little interest or pleasure in doing things",
    "Feeling down, depressed, or hopeless",
    "Trouble falling or staying asleep, or sleeping too much",
    "Feeling tired or having little energy",
    "Poor appetite or overeating",
    "Feeling bad about yourself — or that you are a failure or have let yourself or your family down",
    "Trouble concentrating on things, such as reading the newspaper or watching television",
    "Moving or speaking so slowly that other people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual",
    "Thoughts that you would be better off dead or of hurting yourself in some way"
]

#Preview {
    AsstView()
}
