//
//  TablesView.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

struct TablesView: View {
    
    @Environment(RestaurantStore.self)
    private var store

    private let columns = [
        GridItem(.flexible(), spacing: AppSpacing.medium)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: AppSpacing.large) {
                    ForEach(store.tables) { table in
                        NavigationLink {
                            OrderView(
                                table: table,
                                orderViewModel: store.orderViewModel(for: table)
                            )
                        } label: {
                            TableCard(table: table)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(AppSpacing.large)
            }
            .navigationTitle("Tables")
        }
    }
}

#Preview {
    TablesView()
}
