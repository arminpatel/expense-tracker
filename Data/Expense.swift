//
//  Expense.swift
//  Expense Tracker
//
//  Created by Armin Patel on 05/04/23.
//

import Foundation

@objc public enum Category: Int16, RawRepresentable, CaseIterable {
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
    func imageName() -> String {
        switch self {
            case .noCategory: return "square.3.layers.3d.top.filled"
            case .travel: return "car.circle.fill"
            case .foods: return "fork.knife.circle.fill"
            case .entertainment: return "film.circle.fill"
            case .shopping: return "bag.circle.fill"
            case .groceries: return "carrot.fill"
        }
    }
}

@objc public enum TypeOfExpense: Int16, RawRepresentable, CaseIterable {
    case expense = 0
    case income
    
    func name() -> String {
        switch self {
            case .income: return "Income"
            case .expense: return "Expense"
        }
    }
}
