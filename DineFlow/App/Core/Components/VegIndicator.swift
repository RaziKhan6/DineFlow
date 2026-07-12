//
//  VegIndicator.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct VegIndicator: View {

    let isVegetarian: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .stroke(
                isVegetarian ? .green : .red,
                lineWidth: 1.5
            )
            .frame(width: 14, height: 14)
            .overlay {
                Circle()
                    .fill(isVegetarian ? .green : .red)
                    .frame(width: 6, height: 6)
            }
    }
}

#Preview {
    VStack(spacing: 20) {
        VegIndicator(isVegetarian: true)
        VegIndicator(isVegetarian: false)
    }
}
