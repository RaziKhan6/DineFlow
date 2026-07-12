//
//  MenuViewModel.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation
import Observation

@Observable
final class MenuViewModel {

    let categories = SampleMenu.categories
    let menuItems = SampleMenu.menuItems

    var selectedCategory: Category?

    init() {
        selectedCategory = categories.first
    }

    var filteredItems: [MenuItem] {

        guard let selectedCategory else {
            return menuItems
        }

        return menuItems.filter {
            $0.categoryID == selectedCategory.id
        }
    }

    func selectCategory(_ category: Category) {
        selectedCategory = category
    }
}
