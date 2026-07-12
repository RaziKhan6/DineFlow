//
//  TableStatus.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

enum TableStatus: String {

    case available
    case active
    case preparing
    case billing
    case reserved

    var color: Color {
        switch self {
        case .available: .green
        case .active: .blue
        case .preparing: .purple
        case .billing: .orange
        case .reserved: .gray
        }
    }

    var title: String {
        rawValue.capitalized
    }
}
