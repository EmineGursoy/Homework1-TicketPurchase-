//
//  BusSelectionViewController.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 8.04.2023.
//

import UIKit

class BusSelectionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fromWhereLabel: UILabel!
    @IBOutlet weak var toWhereLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var fromWhere = ""
    var toWhere = ""
    var date = ""
    var dateModel: DateModel?
 
    private var selectedBus: BusModel?
    private var selectedSeats: [Int] = []

    private var expandedCells: [Int] = [] //acik celler tutuluyor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.black
        fromWhereLabel.text = fromWhere
        toWhereLabel.text = toWhere
        dateLabel.text = date
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    func makeAlert(titleInput: String, messageInput: String){
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}
extension BusSelectionViewController: UITableViewDataSource, UITableViewDelegate {
    //cell sayisini döner
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        buses.count
    }
    //cell´i olusturup, icini doldurur
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let busModel = buses[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "busCell", for: indexPath) as! BusTableViewCell
        cell.setUp(
            model: busModel,
            isExpanded: expandedCells.contains(indexPath.row),
            selectedSeats: selectedBus?.id == busModel.id ? selectedSeats : [] // secilen otobus bu otobus ise secilen koltuklari ver, degilse bos dizi ver
        )
        
        cell.onExpandButtonClicked = { //butona tiklandiginda yapilacaklar
            if self.expandedCells.contains(indexPath.row) { //secili cell daha önce acilmisa
                self.expandedCells.removeAll { $0 == indexPath.row } //cell kapatilacagi icin diziden cikarildi
            } else { //secili cell daha önce daha önce acilmadiysa
                self.expandedCells.append(indexPath.row) //cell acilacagi icin diziye eklenir
            }
            
            tableView.reloadData() //table view ici güncellenir
        }
        
        cell.onSeatSelected = { seatNumber in
            if self.selectedSeats.contains(seatNumber) {
                self.selectedSeats.removeAll(where: { $0 == seatNumber})
            } else if let selectedBus = self.selectedBus { // Daha once bir otobus ve koltuk secilmis
                if selectedBus.id != busModel.id { // Daha once secilen koltuk baska bir otobusteyse, secilen koltuklar dizisini sifirlayip yerine sadece bu koltuk numarasi eklendi
                    
                    self.selectedBus = busModel
                    self.selectedSeats = [seatNumber]
                } else { // Daha once secilen koltuk ayni otobusteyse sadece bu yeni koltuk numarasi eklenir
                    if self.selectedSeats.count == 5 {
                        self.makeAlert(titleInput: "Hata", messageInput: "En fazla 5 koltuk secebilirsiniz")
                        return
                    }
                    
                    self.selectedSeats.append(seatNumber)
                }
            } else { // Eger daha once koltuk ve dolayisiyla otobus secilmediyse, secilmis otobusu bu cell'in otobusune set et. Secilmis koltuklari da verilen koltuk numarasini kapsayacak sekilde ayarla
                self.selectedBus = busModel
                self.selectedSeats = [seatNumber]
            }
            
            tableView.reloadData() // Secilen koltuklar guncellendiginde tableView yeniden yuklenir
        }
        
        cell.seatCollectionView.tag = indexPath.section
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? PaymentViewController {
            destinationViewController.selectedBus = selectedBus
            destinationViewController.selectedSeats = selectedSeats
            destinationViewController.fromWhere = fromWhere
            destinationViewController.toWhere = toWhere
            destinationViewController.dateModel = dateModel
        }
    }
}
