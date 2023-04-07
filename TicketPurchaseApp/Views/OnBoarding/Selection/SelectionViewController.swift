//
//  SelectionViewController.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 5.04.2023.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet weak var fromWhereTextField: UITextField!
    
    @IBOutlet weak var toWhereTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    let cities = ["Istanbul","Izmir","Samsun"]
    
    let fromPickerView = UIPickerView()
    let toPickerView = UIPickerView()
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fromPickerView.delegate = self
        fromPickerView.dataSource = self
        
        toPickerView.delegate = self
        toPickerView.dataSource = self
        
        fromWhereTextField.inputView = fromPickerView
        fromWhereTextField.inputAccessoryView = createToolbar()
        toWhereTextField.inputView = toPickerView
        toWhereTextField.inputAccessoryView = createToolbar()
        
        createDatePicker()
    }
    

    func createToolbar() -> UIToolbar {
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        dateTextField.textAlignment = .center
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolbar()
    }
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dateTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func fromWhereClicked(_ sender: Any) {
    }
    
    @IBAction func toWhereClicked(_ sender: Any) {
    }
    @IBAction func dateClicked(_ sender: Any) {
    }
    
    @IBAction func findBusTicketClicked(_ sender: Any) {
    }
}
extension SelectionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
       
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if fromWhereTextField.isFirstResponder {
            fromWhereTextField.text = cities[row]
        } else if toWhereTextField.isFirstResponder {
            toWhereTextField.text = cities[row]
        }
    }
}
