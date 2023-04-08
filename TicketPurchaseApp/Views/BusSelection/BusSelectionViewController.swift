//
//  BusSelectionViewController.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 8.04.2023.
//

import UIKit

class BusSelectionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var expandedCells: [Int] = [] //acik celler tutuluyor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func examineClicked(_ sender: Any) {
    }
}
extension BusSelectionViewController: UITableViewDataSource, UITableViewDelegate {
    //cell sayisini döner
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        buses.count
    }
    //cell´i olusturup, icini doldurur
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "busCell", for: indexPath) as! BusTableViewCell
        cell.setUp(model: buses[indexPath.row], isExpanded: expandedCells.contains(indexPath.row))
        cell.onExpandButtonClicked = { //butona tiklandiginda yapilacaklar
            if self.expandedCells.contains(indexPath.row) { //secili cell daha önce acilmisa
                self.expandedCells.removeAll { $0 == indexPath.row } //cell kapatilacagi icin diziden cikarildi
            } else { //secili cell daha önce daha önce acilmadiysa
                self.expandedCells.append(indexPath.row) //cell acilacagi icin diziye eklenir
            }
            
            tableView.reloadData() //table view ici güncellenir
        }
        cell.seatCollectionView.tag = indexPath.section
        return cell
    }
}
