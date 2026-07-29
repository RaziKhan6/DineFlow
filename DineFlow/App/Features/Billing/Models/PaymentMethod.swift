//
//  PaymentMethod.swift
//  DineFlow
//
//  Created by Razi Khan on 15/07/26.
//

import Foundation

enum PaymentMethod: String, CaseIterable, Identifiable {

    case cash = "Cash"
    case card = "Card"
    case upi = "UPI"

    var id: Self {
        self
    }

    var title: String {
        rawValue
    }

    var systemImage: String {

        switch self {

        case .cash:
            return "banknote.fill"

        case .card:
            return "creditcard.fill"

        case .upi:
            return "qrcode"
        }
    }
}
