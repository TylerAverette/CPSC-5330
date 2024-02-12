//
//  SummaryViewController.swift
//  CurrencyConverter
//
//  Created by Tyler Averette on 2/6/24.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var lblUSD: UILabel!
    @IBOutlet weak var lblCurrency1: UILabel!
    @IBOutlet weak var lblCurrency2: UILabel!
    @IBOutlet weak var lblCurrency3: UILabel!
    @IBOutlet weak var lblCurrency4: UILabel!
    @IBOutlet weak var lblYen: UILabel!
    @IBOutlet weak var lblRuble: UILabel!
    @IBOutlet weak var lblEuro: UILabel!
    @IBOutlet weak var lblPound: UILabel!
    
    var jpYen = ""
    var russianRuble = ""
    var britishPound = ""
    var euro = ""
    var usd = ""
    var currency1Switch = false
    var currency2Switch = false
    var currency3Switch = false
    var currency4Switch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activator()
        lblUSD.text = "$\(usd)0"
        lblCurrency1.text = "¥\(jpYen)"
        lblCurrency2.text = "₽\(russianRuble)"
        lblCurrency3.text = "£\(euro)"
        lblCurrency4.text = "€\(britishPound)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func activator() {
        if (!currency1Switch) {
            lblCurrency1.isHidden = true
            lblYen.isHidden = true
        } else {
            lblCurrency1.isHidden = false
            lblYen.isHidden = false
        }
        
        if (!currency2Switch) {
            lblCurrency2.isHidden = true
            lblRuble.isHidden = true
        } else {
            lblCurrency2.isHidden = false
            lblRuble.isHidden = false
        }
        
        if (!currency3Switch) {
            lblCurrency3.isHidden = true
            lblEuro.isHidden = true
        } else {
            lblCurrency3.isHidden = false
            lblEuro.isHidden = false
        }
        
        if (!currency4Switch) {
            lblCurrency4.isHidden = true
            lblPound.isHidden = true
        } else {
            lblCurrency4.isHidden = false
            lblPound.isHidden = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
