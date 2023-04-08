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
}


let buses: [BusModel] = [
    BusModel(busImage:  UIImage(named: "metro")!, time: "10:00", price: "300 tl"),
    BusModel(busImage:  UIImage(named: "kamilkoc")!, time: "11:00", price: "300 tl"),
    BusModel(busImage:  UIImage(named: "ulusoy")!, time: "12:00", price: "300 tl"),
    BusModel(busImage:  UIImage(named: "nilufer")!, time: "13:00", price: "300 tl")
]
