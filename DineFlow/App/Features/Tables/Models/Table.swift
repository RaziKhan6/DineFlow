//
//  RestaurantTable.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import Foundation

struct Table: Identifiable, Hashable {
    let id: UUID
    let number: Int
    let guestCount: Int
    let totalAmount: Double
    let elapsedMinutes: Int
    let status: TableStatus

    init(
        id: UUID = UUID(),
        number: Int,
        guestCount: Int,
        totalAmount: Double,
        elapsedMinutes: Int,
        status: TableStatus
    ) {
        self.id = id
        self.number = number
        self.guestCount = guestCount
        self.totalAmount = totalAmount
        self.elapsedMinutes = elapsedMinutes
        self.status = status
    }
}
