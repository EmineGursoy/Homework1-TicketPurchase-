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
    
    @IBOutlet weak var seatCollectionView: UICollectionView!
    
    @IBOutlet weak var examineButton: UIButton!
    var onExpandButtonClicked: (() -> Void)? //examine butonu tiklandiginda bu closure cagirilir
    
    override func awakeFromNib() {
        super.awakeFromNib()
        seatCollectionView.delegate = self
        seatCollectionView.dataSource = self
        
    }
    
    func setUp(model: BusModel, isExpanded: Bool) {
        IMAGEvIEW.image = model.busImage
        priceLabel.text = model.price
        timeLabel.text = model.time
        seatCollectionView.isHidden = !isExpanded //kapaliysa C.V. saklanir
        examineButton.titleLabel?.text = isExpanded ? "Kapat" : "Incele" // butonun üstüne acilmissa kapat acilmamissa incele yazar
    }
    
    
    @IBAction func examineClicked(_ sender: Any) {
        onExpandButtonClicked?()
    }
}
extension BusTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 45
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatSelectionCollectionViewCell
        cell.seatImageView.image = UIImage(named: "empty-seat")
        
        
        
        return cell
    }
}
