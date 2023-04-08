//
//  BusTableViewCell.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 8.04.2023.
//

import UIKit

class BusTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var IMAGEvIEW: UIImageView!
    
    func setUp(model: BusModel) {
        IMAGEvIEW.image = model.busImage
        priceLabel.text = model.price
        timeLabel.text = model.time
    }
    
    
    @IBAction func examineClicked(_ sender: Any) {
    }
}
