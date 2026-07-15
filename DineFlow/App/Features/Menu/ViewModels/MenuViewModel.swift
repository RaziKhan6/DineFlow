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
    
    var searchText = ""

    init() {
        selectedCategory = categories.first
    }

    var filteredItems: [MenuItem] {

        var items = menuItems

        if let selectedCategory {
            items = items.filter {
                $0.categoryID == selectedCategory.id
            }
        }

        if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {

            items = items.filter {

                $0.name
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                    .localizedCaseInsensitiveContains(
                        searchText.trimmingCharacters(in: .whitespacesAndNewlines)
                    )
            }
        }

        return items
    }

    func selectCategory(_ category: Category) {
        selectedCategory = category
    }
}
