//
//  BusSelectionViewController.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 8.04.2023.
//

import UIKit

class BusSelectionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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
        cell.setUp(model: buses[indexPath.row])
        return cell
    }
}
