//
//  View+Shadow.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

extension View {

    func cardShadow() -> some View {
        self.shadow(
            color: .black.opacity(0.08),
            radius: 58,
            x: 0,
            y: 2
        )
    }
}
