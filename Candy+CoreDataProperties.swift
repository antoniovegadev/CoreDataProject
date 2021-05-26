//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Antonio Vega on 5/26/21.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unkown Candy"
    }
}

extension Candy : Identifiable {

}
