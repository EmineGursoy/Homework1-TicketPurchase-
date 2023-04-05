//
//  PassengerModel.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 4.04.2023.
//

import Foundation

class PassengerModel {
    let name: String
    let surname: String
    let id: Int
    
    init(name: String = "Isimsiz", surname: String = "Isimsiz", id: Int = 0) {
        self.name = name
        self.surname = surname
        self.id = id
    }
    
    func printPassenger() {
        print("\(name) - \(surname) - \(id)")

    }
  
}
