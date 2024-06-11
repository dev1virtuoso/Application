//
//  SettingView.swift
//  MindCheck
//
//  Created by Carson Wu on 5/12/24.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            VStack {
                Text("Setting")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Colour")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Display")
                    .font(.title2)
                    .fontWeight(.bold)
                
                GroupBox {
                    VStack {
                        Toggle(isOn: .constant(false)) {
                            Text("Dark Mode")
                        }
                        Toggle(isOn: .constant(true)) {
                            Text("Use System Setting")
                        }
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                
                Text("Help and Support")
                    .font(.title2)
                    .fontWeight(.bold)
                
                VStack {
                    Button(action: {
                        openMailApp()
                    }) {
                        Text("Report Bug")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        openWebsite()
                    }) {
                        Text("About Developer")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationBarTitle("Setting")
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image("nav_back_black")
            }))
    }
    
    func openMailApp() {
        let recipient = "carson.developer1125@gmail.com"
        let subject = "Bug Report"
        let deviceModel = getDeviceModel()
        let operatingSystem = getOperatingSystem()
        let body = "Device Model: \(deviceModel)\nOperating System: \(operatingSystem)\n\nPlease provide further info/screenshots on what happened."
        
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        let mailtoLink = "mailto:\(recipient)?subject=\(subjectEncoded)&body=\(bodyEncoded)"
        
        if let url = URL(string: mailtoLink) {
            UIApplication.shared.open(url)
        }
    }
    
    func getDeviceModel() -> String {
        let deviceModel: String
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            deviceModel = "iPad"
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            deviceModel = "iPhone"
        } else {
            deviceModel = "Unknown"
        }
        
        return deviceModel
    }
    
    func getOperatingSystem() -> String {
        let operatingSystem: String
        let systemName = UIDevice.current.systemName
        let systemVersion = UIDevice.current.systemVersion
        
        operatingSystem = "\(systemName) \(systemVersion)"
        
        return operatingSystem
    }
    
    func openWebsite() {
        if let url = URL(string: "https://carson1125.vercel.app") {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingView()
}
