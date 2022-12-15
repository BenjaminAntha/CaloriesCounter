//
//  AddDummyUserView.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 05.12.22.
//

import SwiftUI
import RealmSwift

struct AddDummyUserView: View {
    @ObservedResults(UserAcc.self) var userAcc: Results<UserAcc>
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: refresh){
                    Text("refresh")
                }
                Button(action: addUser){
                    Text("Add USER")
                }
            }.navigationTitle("FOODPRODUCTS")
            
            
            
        }
    }
    
    func refresh() {
        RealmManager.shared.user?.refreshCustomData { (result) in
                   switch result {
                   case .failure(let error):
                       print("Failed to refresh custom data: \(error.localizedDescription)")
                   case .success(let customData):
                       print(customData)
                       return
                   }
               }
    }
    
    func addUser(){
        let userA = UserAcc(firstName:RealmManager.shared.user!.id, lastName: "Mustermann", sex: "m", birthdate: Date(), bodyHeight: 22, goal: Goal.holdWeight, weight: 22, weightGoal: 22, caloriesGoal: 22, userId: RealmManager.shared.user!.id)
        
        $userAcc.append(userA)
        print($userAcc)
    }
}

struct AddDummyUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddDummyUserView()
    }
}
