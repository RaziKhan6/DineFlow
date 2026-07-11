//
//  MenuItem.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

struct MenuItem: Identifiable, Hashable {

    let id: UUID
    let categoryID: UUID

    let name: String
    let price: Double

    let isVegetarian: Bool
    let isAvailable: Bool

    init(
        id: UUID = UUID(),
        categoryID: UUID,
        name: String,
        price: Double,
        isVegetarian: Bool = false,
        isAvailable: Bool = true
    ) {
        self.id = id
        self.categoryID = categoryID
        self.name = name
        self.price = price
        self.isVegetarian = isVegetarian
        self.isAvailable = isAvailable
    }
}
