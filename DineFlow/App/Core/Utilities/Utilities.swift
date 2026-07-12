//
//  Utilities.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

enum CurrencyFormatter {

    static func format(_ amount: Double) -> String {

        let formatter = NumberFormatter()

        formatter.numberStyle = .currency
        formatter.currencyCode = "INR"
        formatter.maximumFractionDigits = 0

        return formatter.string(from: NSNumber(value: amount)) ?? "₹0"
    }
}
