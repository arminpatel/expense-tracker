//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Armin Patel on 04/04/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var expense: FetchedResults<Expense>
    @State private var addExpenseIsShowing =  false
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("\(expense.count)")
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
        }
        .sheet(isPresented: $addExpenseIsShowing) {
            AddExpenseView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
