//
//  PaymentViewController.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 9.04.2023.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    
   private var name: String = ""
   private var surname: String = ""
   private var id: Int = 0
   //private var phoneNumber: String = ""
   //private var email: String = ""
    private var passenger: PassengerModel?
    
    var selectedBus: BusModel?
    var selectedSeats: [Int] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func payButtonClicked(_ sender: Any) {
        
        if nameTextField.text == "" {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen isminizi giriniz")
        } else if  surnameTextField.text == "" {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen soyadinizi giriniz")
        } else if idTextField.text == "" {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen id bilginizi giriniz")
        } else if phoneNumberTextField.text == "" {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen telefon numaranizi giriniz")
        } else if emailTextField.text == "" {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen emailinizi giriniz")
        } else if cardNumberTextField.text == "" {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen kart numaranizi giriniz")
        } else {
            name = nameTextField.text!
            surname = surnameTextField.text!
            id = Int(idTextField.text!)!
            
            passenger = PassengerModel(name: name, surname: surname, id: id)
           
            performSegue(withIdentifier: "toTicketDetail", sender: nil)
        }
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTicketDetail" {
            let destinationVC = segue.destination as! TicketDetailViewController
            
            destinationVC.passenger = PassengerModel(name: name, surname: surname, id: id)
        }
    }
    
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTicketDetail" {
            let destinationVC = segue.destination as! TicketDetailViewController
            
            destinationVC.passenger = passenger
            destinationVC.selectedBus = selectedBus
            destinationVC.selectedSeats = selectedSeats
        }
    }
    
    
    func makeAlert(titleInput: String, messageInput: String){
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
   
    
}
