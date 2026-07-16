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
            titleView
            amountView
            infoView
            statusView
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: .infinity)
        .frame(height: 200)
//        .cardStyle()
        .background(
            table.status == .ready
                ? Color.green.opacity(0.08)
                : Color(.systemBackground)
        )
        .clipShape(RoundedRectangle(cornerRadius: AppRadius.large))
        .overlay(
            RoundedRectangle(cornerRadius: AppRadius.large)
                .stroke(
                    table.status == .ready
                        ? Color.green.opacity(0.3)
                        : Color.clear,
                    lineWidth: 2
                )
        )
        .shadow(
            color: .black.opacity(0.08),
            radius: 8,
            y: 4
        )
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
