//
//  BusModel.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 8.04.2023.
//

import Foundation
import UIKit

struct BusModel {
    let busImage: UIImage
    let time: ClockModel
    let price: Int
    let id: Int

}



let buses: [BusModel] = [
    BusModel(busImage:  UIImage(named: "metro")!, time: ClockModel(hour: 10, minute: 30), price: 300, id: 0),
    BusModel(busImage:  UIImage(named: "kamilkoc")!, time: ClockModel(hour: 11, minute: 30), price: 300, id: 1),
    BusModel(busImage:  UIImage(named: "ulusoy")!, time: ClockModel(hour: 12, minute: 30), price: 300, id: 2),
    BusModel(busImage:  UIImage(named: "nilufer")!, time: ClockModel(hour: 13, minute: 30), price: 300, id: 3)
]
