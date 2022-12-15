//
//  RealmManager.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 26.11.22.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    let app: App
    
    @Published var realm: Realm?
    
    static let shared = RealmManager()
    
    @Published var user: User?
    @Published var configuration: Realm.Configuration?
    
    private init() {
        self.app = App(id: "caloriescounter-dclgv")
        self.user = app.currentUser
    }
    
    func register(emailUser: String, passwordUser: String) async throws {
        let client = app.emailPasswordAuth
        do {
            try await client.registerUser(email: emailUser, password: passwordUser)
            // Registering just registers. You can now log in.
            print("Successfully registered user.")
            // set relation with custom data and user
            try await login(emailUser: emailUser, passwordUser: passwordUser)
           
        } catch {
            print("Failed to register: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func login(emailUser: String, passwordUser: String) async throws{
        user = try await app.login(credentials: Credentials.emailPassword(email: emailUser, password: passwordUser))
        
    }
    
    @MainActor
    func logout(){
        app.currentUser?.logOut { (error) in
            // user is logged out or there was an error
        }
        self.user = app.currentUser
    }

    @MainActor // function is exceuted on the Main thread
    func initializeCurrentUser() async throws {
        
        if user != nil {
            self.configuration = user?.flexibleSyncConfiguration(initialSubscriptions: { subs in
                if let _  = subs.first(named: "all-products"), let _ = subs.first(named: "all-users"), let _ = subs.first(named: "all-dailys"), let _ = subs.first(named: "all-nutrtions") {
                    return
                } else {
                    subs.append(QuerySubscription<FoodProduct>(name: "all-products"))
                    subs.append(QuerySubscription<UserAcc>(name: "all-users"))
                    subs.append(QuerySubscription<Daily>(name: "all-dailys"))
                    subs.append(QuerySubscription<Nutrition>(name: "all-nutrtions"))
                }
            }, rerunOnOpen: true )
            
            realm = try! await Realm(configuration: configuration!, downloadBeforeOpen: .always)
        } else {
            let _ = print("You have to log in")
            
        }
    }
    
    @MainActor // function is exceuted on the Main thread
    func initialize() async throws {
        // flexible Sync
        self.configuration = user?.flexibleSyncConfiguration(initialSubscriptions: { subs in
            if let _  = subs.first(named: "all-products"), let _ = subs.first(named: "all-users"), let _ = subs.first(named: "all-dailys"), let _ = subs.first(named: "all-nutrtions") {
                return
            } else {
                subs.append(QuerySubscription<FoodProduct>(name: "all-products"))
                subs.append(QuerySubscription<UserAcc>(name: "all-users"))
                subs.append(QuerySubscription<Daily>(name: "all-dailys"))
                subs.append(QuerySubscription<Nutrition>(name: "all-nutrtions"))
            }
        }, rerunOnOpen: true )
        
        realm = try! await Realm(configuration: configuration!, downloadBeforeOpen: .always)
    }
}
