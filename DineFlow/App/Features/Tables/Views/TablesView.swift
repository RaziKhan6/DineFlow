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

    @State private var selectedTable: Table?
    @State private var navigateToTable: Table?

    private let columns = [
        GridItem(.flexible(), spacing: AppSpacing.medium)
    ]

    var body: some View {

        NavigationStack {

            ScrollView {

                if store.tables.isEmpty {

                    ContentUnavailableView(
                        "No tables available",
                        systemImage: "table.furniture",
                        description: Text("Please add a table.")
                    )
                    .padding(.top, 80)

                } else {

                    LazyVGrid(columns: columns,
                              spacing: AppSpacing.large) {

                        ForEach(store.tables) { table in

                            Button {

                                if table.status == .available {

                                    selectedTable = table

                                } else {

                                    navigateToTable = table
                                }

                            } label: {

                                TableCard(table: table)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(AppSpacing.large)
                }
            }
            .navigationTitle("Tables")

            .navigationDestination(item: $navigateToTable) { table in

                if table.status == .billing {

                    BillingView(
                        table: table,
                        orderViewModel: store.orderViewModel(for: table)
                    )

                } else {

                    OrderView(
                        table: table,
                        orderViewModel: store.orderViewModel(for: table)
                    )
                }
            }
            
            .sheet(item: $selectedTable, onDismiss: {
                selectedTable = nil
            }) { table in

                GuestCountSheet(
                    table: table
                ) { guestCount in

                    store.startOrder(
                        for: table,
                        guestCount: guestCount
                    )

                    navigateToTable = table
                }
            }
            
        }
    }
}

#Preview {
    TablesView()
}
