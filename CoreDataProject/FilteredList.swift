//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Antonio Vega on 5/26/21.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }
    
    let content: (T) -> Content
    
    var body: some View {
        List(singers, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filterKey: String, filterValue: String, sortDescriptors: [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
