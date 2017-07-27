//
//  ViewController.swift
//  TipPro
//
//  Created by King Justin on 7/26/17.
//  Copyright © 2017 toBeDetermined. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }

    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        print("Hello, this is didReceiveMemoryWarning")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: Any) {
        guard let billAmount = Double(billAmountTextField.text!) else {
            billAmountTextField.text = ""
            tipAmountTextField.text = ""
            totalAmountTextField.text = ""
            return
        }
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
            break
        case 1:
            tipPercentage = 0.18
            break
        case 2:
            tipPercentage = 0.20
            break
        default:
            break
        }

        print( "This is the case: ", tipSelector.selectedSegmentIndex)
        print(tipSelector.selectedSegmentIndex)
        print(tipPercentage)
        
        let roundedBillAmount = round(100*billAmount)/100
        print("This is the roundedbillamount", roundedBillAmount)
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountTextField.isEditing) {
            billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        }
        tipAmountTextField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountTextField.text = String(format: "%.2f", totalAmount)
    }
    

}
