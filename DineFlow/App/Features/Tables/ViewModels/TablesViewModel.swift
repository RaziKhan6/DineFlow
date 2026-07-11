//
//  TablesViewModel.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import Foundation

@Observable
final class TablesViewModel {

    var tables: [RestaurantTable] = [
        RestaurantTable(
            number: 1,
            guestCount: 0,
            totalAmount: 0,
            elapsedMinutes: 0,
            status: .available
        ),
        RestaurantTable(
            number: 2,
            guestCount: 4,
            totalAmount: 1280,
            elapsedMinutes: 18,
            status: .preparing
        ),
        RestaurantTable(
            number: 3,
            guestCount: 2,
            totalAmount: 560,
            elapsedMinutes: 7,
            status: .active
        ),
        RestaurantTable(
            number: 4,
            guestCount: 6,
            totalAmount: 2450,
            elapsedMinutes: 25,
            status: .billing
        ),
        RestaurantTable(
            number: 5,
            guestCount: 0,
            totalAmount: 0,
            elapsedMinutes: 0,
            status: .reserved
        )
    ]
}
