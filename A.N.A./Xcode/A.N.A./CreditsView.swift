//
//  CreditsView.swift
//  A.N.A.
//
//  Created by Carson Wu on 3/31/24.
//

import SwiftUI

struct CreditsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Credits")
                    .font(.title)
                    .fontWeight(.bold)
                
                Link("Bakery (Bakery - Simple Icon Creator)", destination: URL(string: "https://apps.apple.com/hk/app/bakery-simple-icon-creator/id1575220747?l=en-GB&mt=12")!)
                    .foregroundColor(.blue)
                    .padding()
                
                Text("App Icon")
                
                ContributorView(name: "Carson Wu", role: "Designer")
                ContributorView(name: "Carson Wu", role: "Programmer")
                
                ContributorView(name: "H.A.R.P.E.R. (Humane Analysis of Rhetoric, Pronunciation, and Expression in Response)", role: "Human Utterance Tone, Word Choice, and Style Prediction System")
                
                ContributorView(name: "A.R.I.E.L. (Advanced Retrieval and Inference Engine for Learning)", role: "Language Model (Base Model)")
            }
            .padding()
            .navigationBarTitle("Credits")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContributorView: View {
    var name: String
    var role: String
    
    var body: some View {
        VStack {
            Text(name)
                .fontWeight(.bold)
                .padding()
            
            Text(role)
        }
        .padding()
    }
}

#Preview {
    CreditsView()
}
