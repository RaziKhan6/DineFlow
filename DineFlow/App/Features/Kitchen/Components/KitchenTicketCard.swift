//
//  KitchenTicketCard.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct KitchenTicketCard: View {

    
    let ticket: KitchenTicket
    @State private var now = Date()
    @Environment(RestaurantStore.self)
    private var store

    var body: some View {

        VStack(alignment: .leading,
               spacing: AppSpacing.medium) {

            HStack {

                VStack(alignment: .leading) {

                    Text("KOT #\(ticket.ticketNumber)")
                        .font(AppTypography.title)

                    Text("Table \(ticket.tableNumber)")
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text(ticket.status.rawValue)
                    .font(.caption.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        ticket.status == .ready
                            ? .green.opacity(0.15)
                            : .orange.opacity(0.15)
                    )
                    .clipShape(Capsule())
            }

            Divider()

            ForEach(ticket.items) { item in

                HStack {

                    Text("\(item.quantity)x")
                        .fontWeight(.bold)

                    Text(item.menuItem.name)

                    Spacer()
                }
            }

            Divider()

            HStack {

                Image(systemName: "clock.badge")
                
                Text(
                    DurationFormatter.string(
                        from: ticket.createdAt,
                        now: now
                    )
                )
                .monospacedDigit()
                .fontWeight(.semibold)
                .foregroundStyle(
                    DurationFormatter.color(
                        from: ticket.createdAt,
                        now: now
                    )
                )

                Spacer()

                if ticket.status == .pending {

                    Button("Mark Ready") {

                        store.markTicketReady(ticket)
                    }
                    .buttonStyle(.borderedProminent)

                } else {

                    Label("Ready", systemImage: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                }
            }
        }
        .onReceive(
                   Timer.publish(every: 1,
                                 on: .main,
                                 in: .common)
                       .autoconnect()
               ) { value in

                   now = value
               }
        .padding()
        .cardStyle()
    }
}
