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
    @State private var birthday: Date = Date()
    @State var height: String = ""
    @State var weight: String = ""
    @State var selectedGoal: Goal = .holdWeight
    @State var selectedSex = "m"

    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 1950)) ?? Date()
    let endingDate = Date()
   
    var body: some View {
        NavigationView{
            VStack{
                Text("Register")
                    .font(Font.title.bold())
                    .foregroundColor(.gray)
                Form{
                    Section(footer:
                        Button("Create Account") {
                            Task {
                                await addUser()
                            }
                        }
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center))
                    {
                        TextField("Firstname: ", text: $firstName)
                        TextField("Lastname: ", text: $lastName)
                        TextField("Grösse in cm: ", text: $height)
                            .textContentType(.oneTimeCode)
                            .keyboardType(.numberPad)
                        TextField("Gewicht in kg: ", text: $weight)
                            .textContentType(.oneTimeCode)
                            .keyboardType(.numberPad)
                        DatePicker("Geburtstag", selection: $birthday, in: startingDate...endingDate, displayedComponents: [.date])
                        List {
                            Picker("Geschlecht", selection: $selectedSex) {
                                Text("Männlich").tag("m")
                                Text("Weiblich").tag("w")
                            }
                        }
                        List {
                            Picker("Ziel", selection: $selectedGoal) {
                                Text("Zunhemen").tag(Goal.gainWeight)
                                Text("Gewicht halten").tag(Goal.holdWeight)
                                Text("Abnehemen").tag(Goal.loseWeight)
                            }
                        }
                        TextField("Email: ", text: $email)
                        SecureField("Password: ", text: $pw)
                        Spacer()
                    }
                    .listRowSeparator(.hidden)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.gray)
                    
                }.scrollContentBackground(.hidden)
            }
            
        }
      
    }
    
    func addUser() async{
        UserAcc.currentuser.firstName = firstName
        UserAcc.currentuser.lastName = lastName
        UserAcc.currentuser.bodyHeight = Double(height) ?? 0
        UserAcc.currentuser.weight = Double(weight) ?? 0
        UserAcc.currentuser.birthdate = birthday
        UserAcc.currentuser.sex = selectedSex
        UserAcc.currentuser.goal = selectedGoal
        UserAcc.currentuser.caloriesGoal = calculateCaloriesGoal()
        print(UserAcc.currentuser)
        try? await RealmManager.shared.register(emailUser: email, passwordUser: pw)
        try? await RealmManager.shared.initialize()
       
    }
    
    func calculateCaloriesGoal() -> Double{
        let yearNow = Calendar.current.dateComponents([.year], from: Date()).year ?? 0
        let yearBirth = Calendar.current.dateComponents([.year], from: birthday).year ?? 0
        let age: Double = Double(yearNow - yearBirth)
        let weightD: Double = Double(weight) ?? 0
        let heightD: Double = Double(height) ?? 0
        
        if selectedSex == "m" {
            let defaultM = 1.2 * (66 + (13.8 * weightD) +  (5 * heightD) - 6.8 * age)
            switch selectedGoal {
            case .loseWeight:
                return defaultM
            case .gainWeight:
                return defaultM + 500
            case .holdWeight:
                return defaultM - 500
            }
        }else {
            let defaultW = 1.2 * (655 + (9.5 * weightD) + (1.9 * heightD) - (4.7 * age))
            switch selectedGoal {
            case .loseWeight:
                return defaultW
            case .gainWeight:
                return defaultW + 500
            case .holdWeight:
                return defaultW - 500
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
