//
//  News+CoreDataProperties.swift
//  Prova Alamofire CoreData
//
//  Created by Angelo Sannino on 25/07/21.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var strap: String?
    
    var getTitle: String {
        self.title ?? ""
    }
    var getStrap: String {
        self.strap ?? ""
    }

}

extension News : Identifiable {

}
