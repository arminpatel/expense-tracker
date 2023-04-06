//
//  ExpenseView.swift
//  Expense Tracker
//
//  Created by Armin Patel on 05/04/23.
//

import SwiftUI
import CoreData

struct ExpenseView: View {
    var expense: Expense
    var body: some View {
        HStack {
            Image(systemName: expense.category.imageName())
                .padding()
            Text(expense.name ?? "Unknown Expense")
            Spacer()
            Text("\(expense.displayAmount)")
                .foregroundColor(expense.type == .expense ? Color.red : Color.green)
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let expense = Expense(context: moc)
        expense.name = "canteen"
        expense.amount = 60
        expense.date = Date.now
        expense.category = .foods
        expense.type = .expense
        expense.notes = ""
        
        return NavigationView {
            ExpenseView(expense: expense)
        }
    }
}
