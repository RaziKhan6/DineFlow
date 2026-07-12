//
//  MenuList.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct MenuList: View {

    @Bindable var viewModel: MenuViewModel

    var onAdd: (MenuItem) -> Void

    var body: some View {

        LazyVStack(spacing: AppSpacing.medium) {

            ForEach(viewModel.filteredItems) { item in

                MenuItemRow(item: item) {
                    onAdd(item)
                }
            }
        }
        .padding(.horizontal)
    }
}
