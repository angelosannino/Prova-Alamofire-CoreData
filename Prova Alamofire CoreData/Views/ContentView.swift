//
//  ContentView.swift
//  Prova Alamofire CoreData
//
//  Created by Angelo Sannino on 25/07/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject var viewModel = ContentViewModel()
    
    @FetchRequest(entity: News.entity(), sortDescriptors: []) var news: FetchedResults<News>

    var body: some View {
        
        NavigationView {
            List {
                Button(action: {
                    viewModel.downloadNews()
                }, label: {
                    Text("Download News")
                })
                ForEach(news) { news in
                    VStack(alignment: .leading) {
                        Text(news.getTitle)
                            .font(.headline)
                        Text(news.getStrap)
                    }
                }
            }
            .navigationTitle(Text("Prova Persistance"))
        }
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
