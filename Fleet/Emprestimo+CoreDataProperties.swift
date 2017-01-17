//
//  Emprestimo+CoreDataProperties.swift
//  Fleet
//
//  Created by Rafael Lima de Carvalho on 17/01/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import CoreData
import 

extension Emprestimo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emprestimo> {
        return NSFetchRequest<Emprestimo>(entityName: "Emprestimo");
    }

    @NSManaged public var retirada: NSDate?
    @NSManaged public var entrega: NSDate?
    @NSManaged public var previsaodeentrega: NSDate?
    @NSManaged public var origem: String?
    @NSManaged public var destino: String?
    @NSManaged public var condutor: Condutor?
    @NSManaged public var veiculo: Veiculo?
    @NSManaged public var trajetoria: NSSet?

}

// MARK: Generated accessors for trajetoria
extension Emprestimo {

    @objc(addTrajetoriaObject:)
    @NSManaged public func addToTrajetoria(_ value: Trajetoria)

    @objc(removeTrajetoriaObject:)
    @NSManaged public func removeFromTrajetoria(_ value: Trajetoria)

    @objc(addTrajetoria:)
    @NSManaged public func addToTrajetoria(_ values: NSSet)

    @objc(removeTrajetoria:)
    @NSManaged public func removeFromTrajetoria(_ values: NSSet)

}
