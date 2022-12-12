//
//  RegisterView.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 05.12.22.
//

import SwiftUI
import RealmSwift

struct RegisterView: View {
    @ObservedResults(UserAcc.self) var userAccs: Results<UserAcc>

    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var pw = ""
   
    var body: some View {
        NavigationView{
            VStack{
                Text("Register")
                    .font(Font.title.bold())
                    .foregroundColor(.gray)
                Section{
                    TextField("Firstname: ", text: $firstName)
                    TextField("Lastname: ", text: $lastName)
                    TextField("Email: ", text: $email)
                    SecureField("Password: ", text: $pw)
                }
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.gray)
                
                
                Button("Create Account") {
                    Task {
                        await addUser()
                    }
                }
                
                .frame(width: 150, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding()
                
                
            }
            .padding(50)
            .foregroundColor(.green)
        }
      
    }
    
    func addUser() async{
        UserAcc.currentuser.firstName = firstName
        UserAcc.currentuser.lastName = lastName
        print(UserAcc.currentuser)
        try? await RealmManager.shared.register(emailUser: email, passwordUser: pw)
        try? await RealmManager.shared.initialize()
       
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
