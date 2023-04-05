//
//  Expense+CoreDataProperties.swift
//  Expense Tracker
//
//  Created by Armin Patel on 04/04/23.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }
    

    @NSManaged public var id: UUID
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var date: Date?
    @NSManaged public var amount: Double
    @NSManaged public var category: Category
    @NSManaged public var type: TypeOfExpense

}

extension Expense : Identifiable {

}
