//
//  DateModel.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 4.04.2023.
//

import Foundation

struct DateModel {
    let day: Int
    let month: Int
    let year: Int
    
    init(day: Int = 1, month: Int = 1, year: Int = 2021) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    func printDate() {
        print("\(day) / \(month) / \(year)")
    }
}
