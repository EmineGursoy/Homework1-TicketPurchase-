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
    
    let cities = ["Adana", "Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "İçel (Mersin)", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"
    ]
    
    let fromPickerView = UIPickerView()
    let toPickerView = UIPickerView()
    
    let datePicker = UIDatePicker()
    
    
    private var day: Int = 1
    private var month: String = ""
    private var year: Int = 2021
    private var dateString: String = ""
    
    private var date: DateModel?
    private var ticket: TicketModel?
    
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
        doneButton.tintColor = UIColor.black
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        //dateTextField.textAlignment = .center
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
    
    @IBAction func findBusTicketClicked(_ sender: Any) {
        
        if fromWhereTextField.text == "" {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen baslangic lokasyonunu seciniz")
            return
        } else if  toWhereTextField.text == "" {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen varis lokasyonunu seciniz")
            return
        } else if fromWhereTextField.text == toWhereTextField.text {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen baslangic ve varis lokasyonlarini giriniz")
            return
        } else if dateTextField.text == "" {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen gidis tarihini seciniz")
            return
        }
        
        dateString = dateTextField.text!
        var dateArray = dateString.components(separatedBy: " ")
        day = Int(dateArray[0])!
        month = dateArray[1]
        year = Int(dateArray[2])!
        date = DateModel(day: day, month: month, year: year)
        
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBusSelectionPage" {
            let destinationVC = segue.destination as! BusSelectionViewController
            
            destinationVC.fromWhere = fromWhereTextField.text!
            destinationVC.toWhere = toWhereTextField.text!
            destinationVC.date = dateTextField.text!
            destinationVC.dateModel = date
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
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
