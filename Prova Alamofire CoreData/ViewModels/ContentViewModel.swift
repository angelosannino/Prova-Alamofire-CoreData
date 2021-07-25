//
//  ContentViewModel.swift
//  Prova Alamofire CoreData
//
//  Created by Angelo Sannino on 25/07/21.
//

import Foundation
import Alamofire

class ContentViewModel: ObservableObject {
        
    func downloadNews() {
        
        let url = "https://www.hackingwithswift.com/samples/news-1.json"
        
        AF.request(url).responseJSON { response in
            
            if let error = response.error {
                debugPrint(error.localizedDescription)
                return
            }
            
            guard let ilJson = response.value else { return }
            
            if let array = ilJson as? [[String: Any]] {
                
                for news in array {
                    
                    guard let id = news["id"] as? Int,
                          let title = news["title"] as? String,
                          let strap = news["strap"] as? String else { return }

                    PersistenceController.shared.addNewItem(id: id, title: title, strap: strap)
                    
                }
                
            }
            
            
        }
        
    }
    
}
