//
//  Trajetoria+CoreDataClass.swift
//  Fleet
//
//  Created by Student on 1/19/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import CoreData


public class Trajetoria: NSManagedObject {
    
    convenience init(){
        let context = CoreDataManager.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Trajetoria", in: context)
        self.init(entity: entity!, insertInto: context)
    }

}
