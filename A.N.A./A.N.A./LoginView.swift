//
//  LoginView.swift
//  A.N.A.
//
//  Created by Carson Wu on 3/31/24.
//

import SwiftUI

struct LoginView: View {
    @State private var userID: String = ""
    @State private var isLoggedin: Bool = false
    @State private var isSignUpActive = false
    @State private var storedUserID: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Binding var isActive: Bool
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("User ID", text: $userID)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                login()
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            if isLoggedin {
                Text("Welcome, \(userID)!")
                    .font(.title)
                    .padding()
            }
            
            Button(action: {
                isSignUpActive = true
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isSignUpActive, onDismiss: {
                checkSavedUserID()
            }) {
                SignUpView(isActive: $isSignUpActive)
            }
        }
        .padding()
        .onAppear {
            checkSavedUserID()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Login"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func checkSavedUserID() {
        if let savedUserID = UserDefaults.standard.string(forKey: "userID") {
            storedUserID = savedUserID
            isLoggedin = true
        }
    }
    
    func login() {
        if userID == storedUserID {
            isLoggedin = true
            showAlert = true
            alertMessage = "Login successful"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isActive = true
                self.presentationMode.wrappedValue.dismiss()
            }
        } else {
            showAlert = true
            alertMessage = "Invalid UserID"
            
        }
    }
}
