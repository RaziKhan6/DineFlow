//
//  KitchenTicketCard.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct KitchenTicketCard: View {

    let ticket: KitchenTicket

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
                    .background(.orange.opacity(0.15))
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

                Image(systemName: "clock")

                Text(ticket.createdAt,
                     style: .time)

                Spacer()

                Button("Ready") {

                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .cardStyle()
    }
}
