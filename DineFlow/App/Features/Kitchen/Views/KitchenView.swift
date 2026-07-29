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

                    LazyVStack(
                        alignment: .leading,
                        spacing: AppSpacing.large
                    ) {

                        if !preparingTickets.isEmpty {

                            ticketSection(
                                title: "Preparing",
                                systemImage: "flame.fill",
                                tickets: preparingTickets
                            )
                        }

                        if !readyTickets.isEmpty {

                            ticketSection(
                                title: "Ready",
                                systemImage: "checkmark.circle.fill",
                                tickets: readyTickets
                            )
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Kitchen")
        }
    }

    // MARK: - Ticket Section

    private func ticketSection(
        title: String,
        systemImage: String,
        tickets: [KitchenTicket]
    ) -> some View {

        VStack(
            alignment: .leading,
            spacing: AppSpacing.medium
        ) {

            HStack {

                Label(title, systemImage: systemImage)
                    .font(AppTypography.body.weight(.semibold))

                Spacer()

                Text("\(tickets.count)")
                    .font(AppTypography.badge)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(
                        Color.secondary.opacity(0.12),
                        in: Capsule()
                    )
            }

            LazyVStack(spacing: AppSpacing.medium) {

                ForEach(tickets) { ticket in
                    KitchenTicketCard(ticket: ticket)
                }
            }
        }
    }

    // MARK: - Sorted Tickets

    private var preparingTickets: [KitchenTicket] {

        store.kitchenTickets
            .filter {
                $0.status == .preparing
            }
            .sorted {
                $0.createdAt < $1.createdAt
            }
    }

    private var readyTickets: [KitchenTicket] {

        store.kitchenTickets
            .filter {
                $0.status == .ready
            }
            .sorted {
                $0.createdAt > $1.createdAt
            }
    }
}
