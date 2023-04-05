//
//  ClockModel.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 4.04.2023.
//

import Foundation

struct ClockModel {
    let hour: Int
    let minute: Int
    
    init(hour: Int = 0, minute: Int = 1) {
        self.hour = hour
        self.minute = minute
    }
    
    func printClock() {
        print("\(hour) : \(minute)")
    }
    
}
