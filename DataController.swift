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
}
