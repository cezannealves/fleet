//
//  Veiculo+CoreDataProperties.swift
//  Fleet
//
//  Created by Rafael Lima de Carvalho on 17/01/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import CoreData 

extension Veiculo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Veiculo> {
        return NSFetchRequest<Veiculo>(entityName: "Veiculo");
    }

    @NSManaged public var placa: String?
    @NSManaged public var modelo: String?
    @NSManaged public var ano: Int16
    @NSManaged public var emprestimos: NSSet?

}

// MARK: Generated accessors for emprestimos
extension Veiculo {

    @objc(addEmprestimosObject:)
    @NSManaged public func addToEmprestimos(_ value: Emprestimo)

    @objc(removeEmprestimosObject:)
    @NSManaged public func removeFromEmprestimos(_ value: Emprestimo)

    @objc(addEmprestimos:)
    @NSManaged public func addToEmprestimos(_ values: NSSet)

    @objc(removeEmprestimos:)
    @NSManaged public func removeFromEmprestimos(_ values: NSSet)

}
