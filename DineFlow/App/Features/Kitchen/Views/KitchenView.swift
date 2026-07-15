//
//  KitchenView.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct KitchenView: View {

    @Environment(RestaurantStore.self)
    private var store

    var body: some View {

        NavigationStack {

            ScrollView {

                if store.kitchenTickets.isEmpty {

                    ContentUnavailableView(
                        "No kitchen orders",
                        systemImage: "frying.pan",
                        description: Text("New KOTs will appear here.")
                    )
                    .padding(.top, 80)

                } else {

                    LazyVStack(spacing: AppSpacing.large) {

                        ForEach(store.kitchenTickets) { ticket in
                            KitchenTicketCard(ticket: ticket)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Kitchen")
        }
    }
}
