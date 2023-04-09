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
    let time: String
    let price: String
    let id: Int
    let soldSeatNumbers: [Int] 
}


let buses: [BusModel] = [
    BusModel(busImage:  UIImage(named: "metro")!, time: "10:00", price: "300 tl", id: 0, soldSeatNumbers: []),
    BusModel(busImage:  UIImage(named: "kamilkoc")!, time: "11:00", price: "300 tl", id: 1, soldSeatNumbers: []),
    BusModel(busImage:  UIImage(named: "ulusoy")!, time: "12:00", price: "300 tl", id: 2, soldSeatNumbers: []),
    BusModel(busImage:  UIImage(named: "nilufer")!, time: "13:00", price: "300 tl", id: 3, soldSeatNumbers: [])
]
