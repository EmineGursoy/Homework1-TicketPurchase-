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
    @IBOutlet weak var iconsView: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var seatCollectionView: UICollectionView!
    
    @IBOutlet weak var examineButton: UIButton!
    var onExpandButtonClicked: (() -> Void)? //examine butonu tiklandiginda bu closure cagirilir
    
    var onSeatSelected: ((Int) -> Void)?
    
    private var hour: Int = 0
    private var minute: Int = 0
    private var time: ClockModel?
    private var selectedSeats: [Int] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        seatCollectionView.delegate = self
        seatCollectionView.dataSource = self
        
    }
    
    func setUp(model: BusModel, isExpanded: Bool, selectedSeats: [Int]) {
        imageView?.image = model.busImage
        priceLabel.text = String(model.price) + " tl"
        timeLabel.text = timeString(from: model.time)
        seatCollectionView.isHidden = !isExpanded //kapaliysa C.V. saklanir
        examineButton.titleLabel?.text = isExpanded ? "Kapat" : "Incele" // butonun üstüne acilmissa kapat acilmamissa incele yazar
        iconsView.isHidden = !isExpanded
        confirmButton.isHidden = !isExpanded
        
        seatCollectionView.reloadData() // Koltuklarin secilme durumuna gore dogru resminin set edilmesi icin koltuklar collection view'ini bastan yukle
        
        self.selectedSeats = selectedSeats
    }
    
    @IBAction func examineClicked(_ sender: Any) {
        onExpandButtonClicked?()
    }
    @IBAction func confirmClicked(_ sender: Any) {
        
    }
    
    private func timeString(from clockModel: ClockModel) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let dateComponents = DateComponents(calendar: .autoupdatingCurrent, hour: clockModel.hour, minute: clockModel.minute)
        
        let date = dateComponents.date!
        
        return dateFormatter.string(from: date)
    }
    
}
extension BusTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 45
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatSelectionCollectionViewCell
        
        let seatNumber = indexPath.row + 1
        let seatImage = selectedSeats.contains(seatNumber) ? "selected-seat-2" : "empty-seat" // Eger bu koltuk secili koltuklar arasindaysa resmini secilmis koltuk olarak sec, yoksa bos koltuk resimini sec
        cell.seatImageView.image = UIImage(named: seatImage)
        cell.seatNumberLabel.text = String(indexPath.row + 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSeatSelected?(indexPath.row + 1)
    }
}
