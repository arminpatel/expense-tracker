//
//  DataController.swift
//  Expense Tracker
//
//  Created by Armin Patel on 05/04/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "expense-tracker")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data", error.localizedDescription)
            }
        }
    }
    
    func save(name: String, amount: Double, date: Date, category: Category, type: TypeOfExpense, notes: String, context: NSManagedObjectContext) -> Bool {
        let expense = Expense(context: context)
        expense.id = UUID()
        expense.name = name
        expense.amount = type == .expense ? -amount : amount
        expense.date = date
        expense.category = category
        expense.type = type
        expense.notes = notes
        
        if (try? context.save()) != nil {
            print("saved")
            return true
        }
        return false
    }
}
