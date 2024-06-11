//
//  MenuView.swift
//  MindCheck
//
//  Created by Carson Wu on 5/12/24.
//

import SwiftUI

extension UIApplication {
    var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
}

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            NavigationLink(destination: SettingView()) {
                Text("Setting")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: CreditsView()) {
                Text("Credits")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            if let appVersion = UIApplication.shared.appVersion {
                Text("v\(appVersion)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .navigationBarTitle("Menu")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
        }
    }
}

#Preview {
    MenuView()
}
