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
    }
    
    @MainActor // function is exceuted on the Main thread
    func initialize() async throws {
        //authentication
        user = try await app.login(credentials: Credentials.anonymous)
        
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
