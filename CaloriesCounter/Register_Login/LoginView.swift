//
//  LoginView.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 01.12.22.
//

import SwiftUI
import RealmSwift

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    @State private var isLoggingIn = false
    @State var error: Error?
    @ObservedResults(UserAcc.self) var userAcc: Results<UserAcc>

    var body: some View {
        NavigationView{
            VStack {
                if isLoggingIn {
                    ProgressView()
                }
                if let error = error {
                    Text("Error: \(error.localizedDescription)")
                }
                Text("Calories Counter")
                    .font(.title)
                Spacer()
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                Button("Log In") {
                    // Button pressed, so log in
                    isLoggingIn = true
                    Task.init {
                        await login(email: email, password: password)
                        isLoggingIn = false
                    }
                }
                .disabled(isLoggingIn)
                .frame(width: 150, height: 50)
                .background(Color.gray)
                .foregroundColor(.white)
                .clipShape(Capsule())
                
                NavigationLink(destination: RegisterView()) {
                    Label("CREATE ACCOUNT", systemImage: "person.badge.plus")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                
                
                /*
                Button("Create Account") {
                    // Button pressed, so create account and then log in
                    isLoggingIn = true
                    Task {
                        await signUp(email: email, password: password)
                        isLoggingIn = false
                    }
                }
                .disabled(isLoggingIn)
                .frame(width: 150, height: 50)
                .background(Color.gray)
                .foregroundColor(.white)
                .clipShape(Capsule()) */
                
                Spacer()
                
            }
        }
    }
        
    // Logs in with an existing user.
    func login(email: String, password: String) async {
        try? await RealmManager.shared.login(emailUser: email, passwordUser: password)
        try? await RealmManager.shared.initialize()
    }
    
    // Registers a new user with the email/password authentication provider.
    func signUp(email: String, password: String) async {
        try? await RealmManager.shared.register(emailUser: email, passwordUser: password)
        try? await RealmManager.shared.initialize()
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
