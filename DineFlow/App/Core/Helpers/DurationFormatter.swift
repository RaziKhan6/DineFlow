//
//  DurationFormatter.swift
//  DineFlow
//
//  Created by Razi Khan on 15/07/26.
//

import Foundation
import SwiftUI

enum DurationFormatter {

    static func string(
        from startDate: Date,
        now: Date
    ) -> String {

        let seconds = Int(now.timeIntervalSince(startDate))

        let minutes = seconds / 60
        let remainingSeconds = seconds % 60

        return String(
            format: "%02d:%02d",
            minutes,
            remainingSeconds
        )
    }
    
    static func minutes(from startDate: Date, now: Date) -> Int {

        Int(now.timeIntervalSince(startDate)) / 60
    }
    
    static func color(from startDate: Date, now: Date) -> Color {

        let seconds = Int(now.timeIntervalSince(startDate))

        switch seconds {

        case 0..<10:
            return .green

        case 10..<20:
            return .orange

        default:
            return .red
        }
    }
}
