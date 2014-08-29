//
//  ViewController.swift
//  TipCalculator
//
//  Created by Shanky Subramanian on 8/28/14.
//  Copyright (c) 2014 Shanky Subramanian. All rights reserved.
//

import UIKit
var enddate:NSDate = NSDate()
var startdate:NSDate = NSDate()

class ViewController: UIViewController {
                            
    @IBOutlet weak var AmountText: UITextField!
    @IBOutlet weak var TipSegment: UISegmentedControl!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var FourPplLabel: UILabel!
    @IBOutlet weak var ThreePplLabel: UILabel!
    @IBOutlet weak var TwopplLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    
    @IBOutlet weak var ResultView: UIView!
    var date:NSDate = NSDate()
    var currstring:String {
        let zerostr:String = currencyFormatter.stringFromNumber(0)
        return(zerostr.substringToIndex(advance(zerostr.startIndex,1)))
    }
    var currencyFormatter: NSNumberFormatter {
        let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            return formatter
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Do any additional setup after loading the view, typically from a nib.
        AmountText.frame.origin.x = 16
        AmountText.frame.origin.y = 237
        AmountText.text = currstring
        TipSegment.hidden = true
        ResultView.hidden = true
        
    }
    
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func OnTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func AmountValueChange(sender: AnyObject) {
      
        if((AmountText.text == "") || (AmountText.text == currstring)){
            if(AmountText.text == ""){
                AmountText.text = currstring
            }
            AmountText.frame.origin.x = 16
            AmountText.frame.origin.y = 237
            TipSegment.hidden = true
            ResultView.hidden = true
        }
        else
        {
            var temp = AmountText.text.substringFromIndex(advance(AmountText.text.startIndex, 1))
            var amount = NSString(string: temp).doubleValue
            var tipPercentages = [0.18,    0.20,   0.25]
            var tip = amount * tipPercentages[TipSegment.selectedSegmentIndex]
            var total = tip + amount

            
            AmountText.frame.origin.x = 16
            AmountText.frame.origin.y = 75
            TipLabel.text = currencyFormatter.stringFromNumber(tip)
            TotalLabel.text = currencyFormatter.stringFromNumber(total)
            TwopplLabel.text = currencyFormatter.stringFromNumber(total/2)
            ThreePplLabel.text = currencyFormatter.stringFromNumber(total/3)
            FourPplLabel.text = currencyFormatter.stringFromNumber(total/4)
            ResultView.hidden = false
            TipSegment.hidden = false
        }
    }

}

