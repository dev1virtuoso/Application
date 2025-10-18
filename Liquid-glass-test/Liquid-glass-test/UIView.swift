//
//  SwiftUIView.swift
//  Liquid-glass-test
//
//  Created by Carson Wu on 6/11/25.
//

import SwiftUI

struct UIView: View {
    @State private var isOn = false
    @State private var isButtonOn = false
    @State private var sliderValue = 50.0
    @State private var selectedOption = 0
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("SupportView") {
                    VStack {
                        Text("Version:")
                        Text("v0.0.0.3(003)(0003_003-120625a)")
                    }
                    .navigationTitle("Support")
                }
                NavigationLink("UIView") {
                    VStack {
                        Toggle(isOn: $isOn) {
                            Text("Test Toggle")
                        }
                        .padding()
                        Text(isOn ? "Test Toggle on" : "Test Toggle off")
                        
                        Slider(value: $sliderValue, in: 0...100, step: 1.0) {
                            Text("Hello, World!")
                        }
                        .padding()
                        
                        Button(action: {
                            isButtonOn = true
                        }) {
                            Text("Test Button")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        
                        Picker(selection: $selectedOption, label: Text("Hello, World!")) {
                            Text("Test Picker1").tag(0)
                            Text("Test Picker2").tag(1)
                            Text("Test Picker3").tag(2)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        
                        TabView(selection: $selectedTab) {
                            Text("Tab 1 test title").tag(0)
                                .font(.title)
                            Text("Tab 2 test subheadline")
                                .font(.subheadline)
                                .tag(1)
                            Text("Tab 3 test body text")
                                .font(.body)
                                .tag(2)
                        }
                        .tabViewStyle(DefaultTabViewStyle())
                        .padding()
                    }
                    .navigationTitle("Test Navigation Bar")
                }
            }
        }
    }
}

#Preview {
    UIView()
}
