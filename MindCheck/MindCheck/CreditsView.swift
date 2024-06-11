//
//  CreditsView.swift
//  MindCheck
//
//  Created by Carson Wu on 5/12/24.
//

import SwiftUI

struct CreditsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Credits")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Bakery (Bakery - Simple Icon Creator)")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .underline()
                        .padding()
                        .onTapGesture {
                            openWebsite()
                        }
                    Text("App Icon")
                }
                
                VStack {
                    Text("Carson Wu")
                        .fontWeight(.bold)
                        .padding()
                    Text("Designer")
                }
                .padding()
                
                VStack {
                    Text("Carson Wu")
                        .fontWeight(.bold)
                        .padding()
                    Text("Programmer")
                }
                .padding()
            }
            .navigationBarTitle("Credits")
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func openWebsite() {
        if let url = URL(string: "https://apps.apple.com/hk/app/bakery-simple-icon-creator/id1575220747?l=en-GB&mt=12") {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    CreditsView()
}
