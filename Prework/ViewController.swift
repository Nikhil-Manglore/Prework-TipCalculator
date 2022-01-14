//
//  ViewController.swift
//  Prework
//
//  Created by Nikhil Manglore on 1/12/22.
//  Copyright © 2022 Nikhil Manglore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numOfPeopleTextField: UITextField!
    @IBOutlet weak var ButtonControl: UIButton!
    
    // Variable that holds the total bill value
    var totalCalculated: Double = 0.0;
    
    override func viewDidLoad() {
        billAmountTextField.becomeFirstResponder()
        
        // Set the keypad to only show numbers
        billAmountTextField.keyboardType = .asciiCapableNumberPad
        numOfPeopleTextField.keyboardType = .asciiCapableNumberPad
        
        // Rounded Button
        ButtonControl.layer.cornerRadius = 15
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        totalCalculated = total;
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calculateTotalPerPersonAction(_ sender: UIButton) {
        
        // Get the total number of people
        let numOfPeople = Double(numOfPeopleTextField.text!) ?? 1
        
        
        // Get the amount each person should
        let totalPerPerson = totalCalculated / numOfPeople
        var dialogMessage = UIAlertController(title: "Total Per Person", message: String(format: "$%.2f", totalPerPerson), preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
}

