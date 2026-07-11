//
//  TableStatus.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

enum TableStatus: String, CaseIterable {
    case available = "Available"
    case active = "Active"
    case preparing = "Preparing"
    case billing = "Billing"
    case reserved = "Reserved"
}
