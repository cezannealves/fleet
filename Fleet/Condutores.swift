//
//  Condutores.swift
//  Fleet
//
//  Created by Warley Gramacho on 17/01/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import CoreData

class CondutoresDAO
{
    static func insert(condutor: Condutor) -> Bool
    {
        var result = false
        
        CoreDataManager.getContext().insert(condutor)
        
        do {
            try CoreDataManager.getContext().save()
            result = true
            
        } catch let erro as NSError {
            print(erro)
        }
        return result
    }
    
    static func delete(condutor: Condutor) -> Bool
    {
        var result = false
        
        CoreDataManager.getContext().delete(condutor)
        
        do {
            try CoreDataManager.getContext().save()
            result = true
            
        } catch let erro as NSError {
            print(erro)
        }
        return result
    }
    
    static func searchAll() -> [Condutor]
    {
        var condutores = [Condutor]()
        let request: NSFetchRequest<Condutor> = Condutor.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor.init(key: "nome", ascending: true)]
        
        do {
            try condutores = CoreDataManager.getContext().fetch(request)
            print("Total de condutores = ", condutores.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return condutores
    }

}
