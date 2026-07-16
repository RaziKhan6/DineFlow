//
//  TableCard.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

struct TableCard: View {
    
    // MARK: - Properties
    
    let table: Table
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: AppSpacing.medium) {
            if table.status == .ready {
                HStack(spacing: 6) {
                    Image(systemName: "bell.badge.fill")
                    Text("Food Ready")
                }
                .font(.caption.weight(.bold))
                .foregroundStyle(.green)
            }
            titleView
            amountView
            infoView
            statusView
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: .infinity)
        .frame(height: table.status == .ready ? 240 : 200)
        .cardStyle()
        .overlay {

            if table.status == .ready {

                RoundedRectangle(cornerRadius: AppRadius.large)
                    .stroke(.green.opacity(0.5), lineWidth: 2)
            }
        }
        .background {

            if table.status == .ready {

                RoundedRectangle(cornerRadius: AppRadius.large)
                    .fill(.green.opacity(0.06))
            }
        }
    }
    
    // MARK: - Subviews
    
    private var titleView: some View {
        Text("Table \(table.number)")
            .font(AppTypography.title)
    }
    
    private var amountView: some View {
        Text(table.totalAmount, format: .currency(code: "INR"))
            .font(AppTypography.amount)
    }
    
    private var infoView: some View {
        HStack {
            Label("\(table.guestCount)", systemImage: "person.2.fill")
            
            Spacer()
            
            Label("\(table.elapsedMinutes)m", systemImage: "clock")
        }
        .font(AppTypography.body)
    }
    
    private var statusView: some View {

        Group {

            if table.status == .ready {

                Label("READY TO SERVE", systemImage: "fork.knife.circle.fill")
                    .font(AppTypography.badge.weight(.bold))
                    .foregroundStyle(.green)
                    .padding(.horizontal, AppSpacing.medium)
                    .padding(.vertical, AppSpacing.small)
                    .background(Color.green.opacity(0.15))
                    .clipShape(Capsule())

            } else {

                StatusBadge(
                    title: table.status.title,
                    color: table.status.color
                )
            }
        }
    }
}

// MARK: - Preview

#Preview {
    TableCard(
        table: Table(
            number: 7,
            guestCount: 4,
            totalAmount: 1280,
            elapsedMinutes: 18,
            status: .preparing
        )
    )
    .padding()
}
