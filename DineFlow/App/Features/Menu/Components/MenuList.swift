//
//  MenuList.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct MenuList: View {

    @Bindable var viewModel: MenuViewModel

    let quantity: (MenuItem) -> Int
    let onIncrease: (MenuItem) -> Void
    let onDecrease: (MenuItem) -> Void
    
    var body: some View {

        LazyVStack(spacing: AppSpacing.medium) {

            if viewModel.filteredItems.isEmpty {

                ContentUnavailableView(
                    "No menu items found",
                    systemImage: "magnifyingglass",
                    description: Text("Try another search.")
                )
                .padding(.top, 40)

            } else {

                ForEach(viewModel.filteredItems) { item in

                    MenuItemRow(
                        item: item,
                        quantity: quantity(item),
                        onIncrease: {
                            onIncrease(item)
                        },
                        onDecrease: {
                            onDecrease(item)
                        }
                    )
                }
            }
        }
        .padding(.horizontal)
    }
}
