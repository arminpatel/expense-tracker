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
    
    @objc public enum Category: Int16, RawRepresentable {
        case noCategory = 0
        case travel
        case foods
        case entertainment
        case shopping
        case groceries
        
        func name() -> String {
            switch self {
                case .noCategory: return "No Category"
                case .travel: return "Travel"
                case .foods: return "Foods"
                case .entertainment: return "Entertainment"
                case .shopping: return "Shopping"
                case .groceries: return "Groceries"
            }
        }
    }
    
    @objc public enum TypeOfExpense: Int16, RawRepresentable {
        case expense = 0
        case income
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var datetime: Date?
    @NSManaged public var amount: Double
    @NSManaged public var category: Category
    @NSManaged public var type: TypeOfExpense

}

extension Expense : Identifiable {

}
