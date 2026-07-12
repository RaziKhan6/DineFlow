//
//  QuantityStepper.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct QuantityStepper: View {

    let quantity: Int

    let onIncrease: () -> Void
    let onDecrease: () -> Void

    var body: some View {

        Group {

            if quantity == 0 {

                Button(action: onIncrease) {

                    Image(systemName: "plus")
                        .font(.headline.weight(.bold))
                        .frame(width: 44, height: 44)
                }
                .buttonStyle(.plain)
                .background(AppColor.primaryText)
                .foregroundStyle(.white)
                .clipShape(Circle())

            } else {

                HStack(spacing: 20) {

                    Button(action: onDecrease) {

                        Image(systemName: "minus")
                            .font(.headline.weight(.bold))
                    }

                    Text("\(quantity)")
                        .font(AppTypography.body)
                        .fontWeight(.bold)
                        .contentTransition(.numericText())

                    Button(action: onIncrease) {

                        Image(systemName: "plus")
                            .font(.headline.weight(.bold))
                    }
                }
                .frame(height: 44)
                .padding(.horizontal, 14)
                .background(AppColor.card)
                .overlay {

                    Capsule()
                        .stroke(AppColor.border)
                }
            }
        }
        .animation(.spring(duration: 0.25), value: quantity)
    }
}
