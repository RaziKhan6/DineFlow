//
//  GuestCountSheet.swift
//  DineFlow
//
//  Created by Razi Khan on 16/07/26.
//

import SwiftUI

struct GuestCountSheet: View {

    @Environment(\.dismiss)
    private var dismiss

    let table: Table
    let onStart: (Int) -> Void

    @State private var guestCount = 2

    var body: some View {

        NavigationStack {

            VStack(spacing: 32) {

                VStack(spacing: 8) {

                    Text("Table \(table.number)")
                        .font(.title.bold())

                    Text("How many guests?")
                        .foregroundStyle(.secondary)
                }

                HStack(spacing: 32) {

                    Button {

                        if guestCount > 1 {
                            guestCount -= 1
                        }

                    } label: {

                        Image(systemName: "minus.circle.fill")
                            .font(.system(size: 40))
                    }

                    Text("\(guestCount)")
                        .font(.system(size: 42, weight: .bold))
                        .frame(minWidth: 60)

                    Button {

                        guestCount += 1

                    } label: {

                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 40))
                    }
                }

                Button {

                    onStart(guestCount)
                    dismiss()

                } label: {

                    Text("Start Order")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
