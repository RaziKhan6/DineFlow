//
//  SampleMenu.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

enum SampleMenu {

    // MARK: - Categories

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

    static let starters = Category(
        name: "Starters",
        icon: "🍟"
    )

    static let categories: [Category] = [
        pizzas,
        burgers,
        drinks,
        desserts,
        starters
    ]

    // MARK: - Menu Items

    static let menuItems: [MenuItem] = [

        // Pizza
        MenuItem(categoryID: pizzas.id, name: "Margherita", price: 299, isVegetarian: true),
        MenuItem(categoryID: pizzas.id, name: "Farmhouse", price: 399, isVegetarian: true),
        MenuItem(categoryID: pizzas.id, name: "Veg Deluxe", price: 349, isVegetarian: true),
        MenuItem(categoryID: pizzas.id, name: "Paneer Tikka Pizza", price: 429, isVegetarian: true),
        MenuItem(categoryID: pizzas.id, name: "Pepperoni", price: 499),

        // Burger
        MenuItem(categoryID: burgers.id, name: "Veg Burger", price: 149, isVegetarian: true),
        MenuItem(categoryID: burgers.id, name: "Cheese Burger", price: 189),
        MenuItem(categoryID: burgers.id, name: "Chicken Burger", price: 229),
        MenuItem(categoryID: burgers.id, name: "Double Patty Burger", price: 299),

        // Drinks
        MenuItem(categoryID: drinks.id, name: "Coke", price: 60),
        MenuItem(categoryID: drinks.id, name: "Pepsi", price: 60),
        MenuItem(categoryID: drinks.id, name: "Sprite", price: 60),
        MenuItem(categoryID: drinks.id, name: "Mineral Water", price: 30),
        MenuItem(categoryID: drinks.id, name: "Cold Coffee", price: 120),

        // Desserts
        MenuItem(categoryID: desserts.id, name: "Brownie", price: 150, isVegetarian: true),
        MenuItem(categoryID: desserts.id, name: "Chocolate Lava Cake", price: 180, isVegetarian: true),
        MenuItem(categoryID: desserts.id, name: "Vanilla Ice Cream", price: 90, isVegetarian: true),
        MenuItem(categoryID: desserts.id, name: "Gulab Jamun", price: 80, isVegetarian: true),

        // Starters
        MenuItem(categoryID: starters.id, name: "French Fries", price: 140, isVegetarian: true),
        MenuItem(categoryID: starters.id, name: "Cheese Garlic Bread", price: 180, isVegetarian: true),
        MenuItem(categoryID: starters.id, name: "Paneer Tikka", price: 260, isVegetarian: true),
        MenuItem(categoryID: starters.id, name: "Chicken Wings", price: 320),
        MenuItem(categoryID: starters.id, name: "Spring Rolls", price: 210, isVegetarian: true)
    ]
}
