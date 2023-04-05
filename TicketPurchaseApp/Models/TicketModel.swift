//
//  Ticket.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 1.04.2023.
//

import Foundation

struct TicketModel {
    let passenger: PassengerModel
    let date: DateModel
    let clock: ClockModel
    let seat: Int
    let seatNumber: Int = 0
    
    init(passenger: PassengerModel, date: DateModel, clock: ClockModel, seat: Int, seatNumber: Int) {
        self.passenger = passenger
        self.date = date
        self.clock = clock
        self.seat = seat
    }
    
    func ticketCompare(ticket: TicketModel) -> Bool {
       return true
    }
    
    func reserveASeat(seatNumber: Int) { 
        
    }
    
    func addSeatNumber(seatNumber: Int) {
       
    }
    
    func printTicket() {
        print("<\(passenger.name)> <\(passenger.surname) <\(passenger.id)> , <\(date.day) - \(date.month) - \(date.year) , <\(clock.hour) : \(clock.minute)")
        
    }
    
}
