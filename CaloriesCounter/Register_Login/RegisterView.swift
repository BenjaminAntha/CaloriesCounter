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
                TextField("Firstname: ", text: $firstName)
                TextField("Lastname: ", text: $lastName)
                TextField("Email: ", text: $email)
                SecureField("Password: ", text: $pw)
                
                Button("Create Account") {
                    Task {
                        await addUser()
                    }
                }
                .frame(width: 150, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                
            }
        }
      
    }
    
    func addUser() async{
        try? await RealmManager.shared.register(emailUser: email, passwordUser: pw)
        try? await RealmManager.shared.initialize()
        //let userA = UserAcc(firstName: firstName, lastName: lastName, sex: "m", birthdate: Date(), bodyHeight: 22, goal: Goal.holdWeight, weight: 22, weightGoal: "22", caloriesGoal: 22, userId: email)
        
        //$userAccs.append(userA)
        UserAcc.currentuser.firstName = firstName
        UserAcc.currentuser.lastName = lastName
     
        //print($userAccs)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}