//
//  Trajetoria+CoreDataProperties.swift
//  Fleet
//
//  Created by Student on 1/19/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import CoreData


extension Trajetoria {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trajetoria> {
        return NSFetchRequest<Trajetoria>(entityName: "Trajetoria");
    }

    @NSManaged public var latitude: String?
    @NSManaged public var longitude: String?
    @NSManaged public var timestamp: NSDate?
    @NSManaged public var velocidademedia: Float
    @NSManaged public var time: String?
    @NSManaged public var placa: String?
    @NSManaged public var emprestimo: Emprestimo?

}
