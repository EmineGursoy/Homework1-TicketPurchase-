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
    let price: String
    let id: Int
    let soldSeatNumbers: [Int]
    var date: DateModel?
}



let buses: [BusModel] = [
    BusModel(busImage:  UIImage(named: "metro")!, time: ClockModel(hour: 10, minute: 00), price: "300 tl", id: 0, soldSeatNumbers: [], date: nil),
    BusModel(busImage:  UIImage(named: "kamilkoc")!, time: ClockModel(hour: 11, minute: 00), price: "300 tl", id: 1, soldSeatNumbers: [], date: nil),
    BusModel(busImage:  UIImage(named: "ulusoy")!, time: ClockModel(hour: 12, minute: 00), price: "300 tl", id: 2, soldSeatNumbers: [], date: nil),
    BusModel(busImage:  UIImage(named: "nilufer")!, time: ClockModel(hour: 13, minute: 00), price: "300 tl", id: 3, soldSeatNumbers: [], date: nil)
]
