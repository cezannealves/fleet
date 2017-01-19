//
//  Condutor+CoreDataProperties.swift
//  Fleet
//
//  Created by Student on 1/19/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import CoreData


extension Condutor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Condutor> {
        return NSFetchRequest<Condutor>(entityName: "Condutor");
    }

    @NSManaged public var cnh: String?
    @NSManaged public var foto: NSData?
    @NSManaged public var matricula: String?
    @NSManaged public var nome: String?
    @NSManaged public var emprestimos: NSSet?

}

// MARK: Generated accessors for emprestimos
extension Condutor {

    @objc(addEmprestimosObject:)
    @NSManaged public func addToEmprestimos(_ value: Emprestimo)

    @objc(removeEmprestimosObject:)
    @NSManaged public func removeFromEmprestimos(_ value: Emprestimo)

    @objc(addEmprestimos:)
    @NSManaged public func addToEmprestimos(_ values: NSSet)

    @objc(removeEmprestimos:)
    @NSManaged public func removeFromEmprestimos(_ values: NSSet)

}
