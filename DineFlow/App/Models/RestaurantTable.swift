//
//  RestaurantTable.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import Foundation

struct RestaurantTable: Identifiable {
    let id = UUID()

    let name: String
    let guests: Int
    let amount: Double
    let elapsedMinutes: Int
    let status: TableStatus
}
