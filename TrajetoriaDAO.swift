//
//  TrajetoriaDAO.swift
//  Fleet
//
//  Created by Student on 1/19/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import CoreData

class TrajetoriaDao{
    static func insert() -> Bool {
        var result = false
        
        do {
            try CoreDataManager.getContext().save()
            result = true
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return result
    }
    
    static func delete(trajetoria: Trajetoria) -> Bool {
        var result = false
        
        CoreDataManager.getContext().delete(trajetoria)
        
        do {
            try CoreDataManager.getContext().save()
            result = true
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return result
    }
    
    static func searchAll() -> [Trajetoria] {
        var trajeto = [Trajetoria]()
        let request: NSFetchRequest<Trajetoria> = Trajetoria.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor.init(key: "time", ascending: true)]
        
        
        do {
            try trajeto = CoreDataManager.getContext().fetch(request)
            //print("Total de apps cadastrados = ", trajeto.count)
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return trajeto
    }
}
