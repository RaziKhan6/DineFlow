//
//  CategoryBar.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct CategoryBar: View {

    @Bindable var viewModel: MenuViewModel

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            HStack(spacing: AppSpacing.medium) {

                ForEach(viewModel.categories) { category in

                    CategoryChip(
                        category: category,
                        isSelected: viewModel.selectedCategory?.id == category.id
                    )
                    .onTapGesture {
                        viewModel.selectCategory(category)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {

    CategoryBar(
        viewModel: MenuViewModel()
    )
}
