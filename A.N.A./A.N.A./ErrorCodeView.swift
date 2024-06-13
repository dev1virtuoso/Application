//
//  ErrorCodeView.swift
//  A.N.A.
//
//  Created by Carson Wu on 4/2/24.
//

import SwiftUI

struct ErrorCodeView: View {
    var body: some View {
        VStack {
            Text("Error")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Error Code: 400")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("Error Description: Bad Request")
                .font(.headline)
                .padding()
            
            Text("Error Code: 500")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("Error Description: Internal Server Error")
                .font(.headline)
                .padding()
            
            Text("Error Code: 404")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("Error Description: Page Not Found")
                .font(.headline)
                .padding()
        }
        .navigationBarTitle("Error Code")
        .padding()
    }
}
