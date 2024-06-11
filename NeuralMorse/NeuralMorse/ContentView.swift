//
//  ContentView.swift
//  NeuralMorse
//
//  Created by Carson Wu on 5/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    @State private var morseCode = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Text to Morse Code Converter")
                    .font(.title)
                    .padding()
                
                TextField("Enter text", text: $inputText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Convert to Morse Code") {
                    morseCode = convertToMorseCode(inputText)
                }
                .padding()
                
                Text("Morse Code:")
                    .font(.headline)
                Text(morseCode)
                    .padding()
                
                Button("Copy Morse Code") {
                    copyToClipboard(morseCode)
                }
                .padding()
                .foregroundColor(.blue)
                
                Spacer()
            }
            .padding()
            .navigationTitle("NeuralMorse")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: MenuView()) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
    
    func convertToMorseCode(_ text: String) -> String {
        let morseCodeMap: [Character: String] = [
            "A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".",
            "F": "..-.", "G": "--.", "H": "....", "I": "..", "J": ".---",
            "K": "-.-", "L": ".-..", "M": "--", "N": "-.", "O": "---",
            "P": ".--.", "Q": "--.-", "R": ".-.", "S": "...", "T": "-",
            "U": "..-", "V": "...-", "W": ".--", "X": "-..-", "Y": "-.--",
            "Z": "--.."
        ]
        
        let uppercasedText = text.uppercased()
        var result = ""
        
        for char in uppercasedText {
            if let morse = morseCodeMap[char] {
                result += morse + " "
            } else {
                result += " "
            }
        }
        
        return result
    }
    
    func copyToClipboard(_ text: String) {
            UIPasteboard.general.string = text
        }
    }

#Preview {
    ContentView()
}
