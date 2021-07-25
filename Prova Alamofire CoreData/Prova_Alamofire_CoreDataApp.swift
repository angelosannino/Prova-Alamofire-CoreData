//
//  Prova_Alamofire_CoreDataApp.swift
//  Prova Alamofire CoreData
//
//  Created by Angelo Sannino on 25/07/21.
//

import SwiftUI

@main
struct Prova_Alamofire_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
