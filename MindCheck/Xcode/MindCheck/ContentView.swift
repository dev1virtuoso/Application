//
//  ContentView.swift
//  MindCheck
//
//  Created by Carson Wu on 5/12/24.

import SwiftUI

struct ContentView: View {
    @State private var isMenuActive = false
    @State private var isAsstActive = false
    @State private var isSummaryActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    isSummaryActive = true
                }) {
                    Text("Summary")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $isSummaryActive) {
                    SummaryView()
                }
                
                Button(action: {
                    isAsstActive = true
                }) {
                    Text("Take an Assessment")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $isAsstActive) {
                    AsstView()
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("MindCheck")
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
}
