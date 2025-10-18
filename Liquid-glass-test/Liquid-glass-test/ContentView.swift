//
//  ContentView.swift
//  Liquid-glass-test
//
//  Created by Carson Wu on 6/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: UIView()) {
                    Text("UIView")
                }
            }
            .navigationTitle("Navigation Bar")
        }
    }
}

#Preview {
    ContentView()
}
