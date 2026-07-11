//
//  SampleMenu.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

enum SampleMenu {

    static let pizzas = Category(
        name: "Pizza",
        icon: "🍕"
    )

    static let burgers = Category(
        name: "Burger",
        icon: "🍔"
    )

    static let drinks = Category(
        name: "Drinks",
        icon: "🥤"
    )

    static let desserts = Category(
        name: "Desserts",
        icon: "🍰"
    )

    static let categories: [Category] = [
        pizzas,
        burgers,
        drinks,
        desserts
    ]
}
