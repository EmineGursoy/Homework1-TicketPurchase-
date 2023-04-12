//
//  TicketDetailViewController.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 9.04.2023.
//

import UIKit

class TicketDetailViewController: UIViewController {

    @IBOutlet weak var busCompanyLogoImageView: UIImageView!
    @IBOutlet weak var fromWhereLabel: UILabel!
    @IBOutlet weak var toWhereLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var selectedSeatsLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
        
    var passenger: PassengerModel?
    var selectedBus: BusModel?
    var dateModel: DateModel?
    var selectedSeats: [Int] = []
    var fromWhere: String = ""
    var toWhere: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        busCompanyLogoImageView.image = selectedBus?.busImage
        fromWhereLabel.text = fromWhere
        toWhereLabel.text = toWhere
        nameLabel.text = passenger?.name
        surnameLabel.text = passenger?.surname
        idLabel.text = String(passenger?.id ?? 0)
        
        dateLabel.text = "\(dateModel!.day) / \(dateModel!.month) / \(dateModel!.year)"
        hourLabel.text = "\(selectedBus!.time.hour):\(selectedBus!.time.minute)"
        
        for i in 0...selectedSeats.count-1 {
            selectedSeatsLabel.text?.append(String(selectedSeats[i]) + ", ")

        }
        
        totalCostLabel.text = String((selectedBus!.price) * (selectedSeats.count)) + " tl"
       
    }
   
}
