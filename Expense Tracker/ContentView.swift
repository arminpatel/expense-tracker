//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Armin Patel on 04/04/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var expenses: FetchedResults<Expense>
    @State private var totalAmount: Double = 0.0
    @State private var addExpenseIsShowing =  false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(totalAmount, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(totalAmount < 0.0 ? Color.red : Color.green)
                    .onAppear(perform: calculateTotalAmount)
                List {
                    ForEach(expenses) { expense in
                        ExpenseView(expense: expense)
                    }
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            addExpenseIsShowing.toggle()
                        } label: {
                            Label("Add expense", systemImage: "plus")
                        }
                        
                    }
                }
                .onChange(of: expenses.count) { newValue in
                    calculateTotalAmount()
                }
            }
            .sheet(isPresented: $addExpenseIsShowing) {
                AddExpenseView()
            }
        }
    }
    
    func calculateTotalAmount() {
        totalAmount = 0.0
        for expense in expenses {
            totalAmount += expense.amount
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
