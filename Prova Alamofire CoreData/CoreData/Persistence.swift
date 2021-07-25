//
//  Persistence.swift
//  Prova Alamofire CoreData
//
//  Created by Angelo Sannino on 25/07/21.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    func addNewItem(id: Int, title: String, strap: String) {
        
        let newsId = Int64(id)
        
        let newNews = News(context: self.container.viewContext)
        newNews.id = newsId
        newNews.title = title
        newNews.strap = strap
        
        self.save()
        
    }
    
    func save() {
        do {
            try self.container.viewContext.save()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Prova_Alamofire_CoreData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
}
