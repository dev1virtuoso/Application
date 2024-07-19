//
//  AccountView.swift
//  A.N.A.
//
//  Created by Carson Wu on 3/31/24.
//

import SwiftUI

struct AccountView: View {
    @State private var isDeleteAccountToggled = false
    @State private var username: String = ""
    @AppStorage("firstName") private var firstName: String = ""
    @AppStorage("lastName") private var lastName: String = ""
    @State private var isLoginViewActive = false
    @State private var isSignOutConfirmationPresented = false
    @State private var isDeleteAccountConfirmationPresented = false
    @State private var isDeletingAccount = false
    
    struct CustomButtonView: View {
        let title: String
        let backgroundColor: Color
        
        var body: some View {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(10)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                Form {
                    UserInformationView()
                    
                    Section {
                        Button(action: {
                            isLoginViewActive = true
                        }) {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $isLoginViewActive) {
                            LoginView(isActive: $isLoginViewActive)
                        }
                        
                        Button(action: {
                            isSignOutConfirmationPresented = true
                        }) {
                            CustomButtonView(title: "Sign Out", backgroundColor: .red)
                        }
                        
                        Section {
                            if isDeletingAccount {
                                ProgressView("Deleting Account...")
                            } else {
                                Button(action: {
                                    isDeleteAccountConfirmationPresented = true
                                }) {
                                    CustomButtonView(title: "Delete Account", backgroundColor: .red)
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Account")
            }
        }
        .alert(isPresented: $isSignOutConfirmationPresented) {
            Alert(
                title: Text("Sign Out"),
                message: Text("Are you sure you want to sign out?"),
                primaryButton: .default(Text("Sign Out"), action: signOut),
                secondaryButton: .cancel()
            )
        }
        .alert(isPresented: $isDeleteAccountConfirmationPresented) {
            Alert(
                title: Text("Delete Account"),
                message: Text("Are you sure you want to delete your account?"),
                primaryButton: .destructive(Text("Delete"), action: deleteAccount),
                secondaryButton: .cancel()
            )
        }
    }
    
    private func signOut() {
        // Handle sign out operation
    }
    
    private func deleteAccount() {
        isDeletingAccount = true
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsURL.appendingPathComponent("ana_user_details.json")
        
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("Account deleted successfully")
        } catch {
            print("Error deleting account: \(error)")
        }
        
        isDeletingAccount = false
    }
}

struct UserInformationView: View {
    @AppStorage("firstName") private var firstName: String = ""
    @AppStorage("lastName") private var lastName: String = ""
    
    var body: some View {
        Section(header: Text("User Information")) {
            VStack(alignment: .leading) {
                Image(systemName: "person.circle")
                    .font(.system(size: 60))
                
                VStack(alignment: .leading) {
                    Text(firstName.isEmpty ? "First Name" : firstName)
                        .font(.headline)
                    Text(lastName.isEmpty ? "Last Name" : lastName)
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
