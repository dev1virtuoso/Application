//
//  SignUpView.swift
//  A.N.A.
//
//  Created by Carson Wu on 3/31/24.
//

import SwiftUI

struct SignUpView: View {
    @Binding var isActive: Bool
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var userID: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var storedUserID: String = ""
    @State private var fileURLString: String = "" 
    
    struct User: Codable {
        let firstName: String
        let lastName: String
        let userID: String
    }
    
    var body: some View {
        VStack {
            TextField("First Name", text: $firstName)
                .padding()
            
            TextField("Last Name", text: $lastName)
                .padding()
            
            TextField("User ID", text: $userID)
                .padding()
            
            Button(action: {
                signUp()
            }) {
                Text("Sign Up")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text("Sign-up successful\nUser details saved to: \(fileURLString)") // 顯示檔案路徑
            
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Sign-up Successful"), message: Text(alertMessage), dismissButton: .default(Text("Close")))
        }
    }
    
    func signUp() {
        guard !firstName.isEmpty, !lastName.isEmpty, !userID.isEmpty else {
            showAlert = true
            alertMessage = "Please fill in all the fields."
            return
        }
        
        guard userID != storedUserID else {
            showAlert = true
            alertMessage = "User ID already exists. Please choose a different one."
            return
        }
        
        let newUser = User(firstName: firstName, lastName: lastName, userID: userID)
        
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .prettyPrinted
            let jsonData = try jsonEncoder.encode(newUser)
            
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("ana_user_details.json")
            
            try jsonData.write(to: fileURL)
            
            fileURLString = fileURL.path
            
            alertMessage = "Sign-up successful\nUser details saved to: \(fileURL.path)"
            showAlert = true
            
            UserDefaults.standard.set(userID, forKey: "userID")
            
            storedUserID = userID
        } catch {
            alertMessage = "Error: \(error)"
            showAlert = true
        }
        
        firstName = ""
        lastName = ""
        userID = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isActive = false
        }
    }
}
