//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Armin Patel on 04/04/23.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
