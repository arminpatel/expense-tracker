//
//  AddExpense.swift
//  Expense Tracker
//
//  Created by Armin Patel on 05/04/23.
//

import SwiftUI

struct AddExpenseView: View {
    let dataController = DataController()
    @Environment(\.managedObjectContext) var moc
    @State private var name: String = ""
    @State private var amount: Double = 0.0
    @State private var date: Date = Date.now
    @State private var category: Category = .noCategory
    @State private var type: TypeOfExpense = .expense
    @State private var notes: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Amount", value: $amount, formatter: formatter)
                        .keyboardType(.decimalPad)
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
                Section {
                    Picker("Category", selection: $category) {
                        ForEach(Category.allCases, id: \.rawValue) {item in
                            Text("\(item.name())").tag(item)
                        }
                    }
                    
                    Picker("Type of Expense", selection: $type) {
                        ForEach(TypeOfExpense.allCases, id: \.rawValue) {item in
                            Text("\(item.name())").tag(item)
                        }
                    }
                }
                Section("Notes"){
                    TextEditor(text: $notes)
                }
                
                Button {
                    if(dataController.save(name: name, amount: amount, date: date, category: category, type: type, notes: notes, context: moc)) {
                        dismiss()
                    }
                } label: {
                    Text("Save")
                }
                .disabled(validateForm())
            }
        }
    }
    
    func validateForm() -> Bool {
        return name.isEmpty || amount == 0
    }
}

struct AddExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
