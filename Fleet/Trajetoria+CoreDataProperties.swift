//
//  Trajetoria+CoreDataProperties.swift
//  Fleet
//
//  Created by Rafael Lima de Carvalho on 17/01/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import CoreData
import 

extension Trajetoria {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trajetoria> {
        return NSFetchRequest<Trajetoria>(entityName: "Trajetoria");
    }

    @NSManaged public var timestamp: NSDate?
    @NSManaged public var latitude: String?
    @NSManaged public var longitude: String?
    @NSManaged public var velocidademedia: Float
    @NSManaged public var emprestimo: Emprestimo?

}
