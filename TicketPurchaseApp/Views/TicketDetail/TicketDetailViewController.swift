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
    
    var name: String = ""
    var surname: String = ""
    var id: Int = 0
    
    //var passenger: PassengerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        nameLabel.text = passenger?.name
        surnameLabel.text = passenger?.surname
        idLabel.text = String(passenger?.id ?? 0)
         */
      
        nameLabel.text = name
        surnameLabel.text = surname
        idLabel.text = String(id)
    }
   
}
