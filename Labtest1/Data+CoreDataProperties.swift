//
//  Data+CoreDataProperties.swift
//  Labtest1
//
//  Created by MacStudent on 2020-01-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//
//

import Foundation
import CoreData


extension Data {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Data> {
        return NSFetchRequest<Data>(entityName: "Data")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32
    @NSManaged public var date: Date?
    @NSManaged public var fees: Double

}
