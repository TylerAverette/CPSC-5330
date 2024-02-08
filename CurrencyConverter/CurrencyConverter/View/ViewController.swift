//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Tyler Averette on 2/6/24.
//

// TOFIX
// Fix constraints


import UIKit

class ViewController: UIViewController {

    var currency1Switch = false
    var currency2Switch = false
    var currency3Switch = false
    var currency4Switch = false
    @IBOutlet weak var usdTextField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func usdTextFieldChanged(_ sender: UITextField) {
        // This function is on editingchanged
        
        var text: String = usdTextField.text!
        let numbers: [Character] = ["0","1","2","3","4","5","6","7","8", "9"]
        
        if let lastCharacter = text.last {
            if !numbers.contains(lastCharacter) {
                text.removeLast()
                usdTextField.text = text
            }
        }
    }
    
    @IBAction func currency1(_ sender: UISwitch) {
        if sender.isOn{
            currency1Switch = true
        } else {
            currency1Switch = false
        }
    }
    
    @IBAction func currency2(_ sender: UISwitch) {
        if sender.isOn{
            currency2Switch = true
        } else {
            currency2Switch = false
        }
    }
    
    @IBAction func currency3(_ sender: UISwitch) {
        if sender.isOn{
            currency3Switch = true
        } else {
            currency3Switch = false
        }
    }
    
    @IBAction func currency4(_ sender: UISwitch) {
        if sender.isOn{
            currency4Switch = true
        } else {
            currency4Switch = false
        }
    }
    
    @IBAction func convert(_ sender: UIButton) {
        if (Float(usdTextField.text!) == 0 || usdTextField.text!.isEmpty) {
            noDollarAmountAlert()
            return;
        }
        
        if (currency1Switch == false
            &&  currency2Switch == false
            &&  currency3Switch == false
            &&  currency4Switch == false) {
            noSelectionAlert()
            return
        }
        
        ConversionLogic.usd = Float(usdTextField.text!) ?? 0
        ConversionLogic.convertDollar()
        self.performSegue(withIdentifier: "toSummaryViewController", sender: self)
    }
    
    func noSelectionAlert() {
        let alert = UIAlertController(title: "No target currency selected", message: "Please select a currency for conversion", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {_ in
                print("Cancel Action")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func noDollarAmountAlert() {
        let alert = UIAlertController(title: "Invalid Amount", message: "Please input a proper dollar amount", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {_ in
                print("Cancel Action")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSummaryViewController" {
            let target = segue.destination as! SummaryViewController
            target.usd = String(ConversionLogic.usd)
            target.jpYen = String(ConversionLogic.jpYen)
            target.russianRuble = String(ConversionLogic.russianRuble)
            target.euro = String(ConversionLogic.euro)
            target.britishPound = String(ConversionLogic.britishPound)
            target.currency1Switch = currency1Switch
            target.currency2Switch = currency2Switch
            target.currency3Switch = currency3Switch
            target.currency4Switch = currency4Switch
        }
    }
}

