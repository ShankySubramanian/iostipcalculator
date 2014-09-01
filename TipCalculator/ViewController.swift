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
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var SplitTotal: UILabel!
    @IBOutlet weak var ResultView: UIView!
    @IBOutlet weak var SplitSlider: UISlider!
    
    @IBOutlet weak var SplitstrLabel: UILabel!
    @IBOutlet weak var SplitValue: UILabel!
  
    @IBOutlet weak var SplitLabel: UILabel!
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
        SplitSlider.hidden = true
        SplitstrLabel.hidden = true
        SplitLabel.hidden = true
        
    }
    
    

    @IBAction func SliderChange(sender: AnyObject) {
        var val = Int(SplitSlider.value)
        SplitLabel.text = String(Int(SplitSlider.value))
        SplitLabel.frame.origin.x = CGFloat(92 + 9 * val)
    }
    

    @IBAction func onTouch(sender: AnyObject) {
        view.endEditing(true)
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
            SplitSlider.hidden = true
            SplitstrLabel.hidden = true
            SplitLabel.hidden = true
            
        }
        else
        {
            var temp = AmountText.text.substringFromIndex(advance(AmountText.text.startIndex, 1))
            var amount = NSString(string: temp).doubleValue
            var tipPercentages = [0.18,    0.20,   0.25]
            var tip = amount * tipPercentages[TipSegment.selectedSegmentIndex]
            var total = tip + amount
            var split = Double(Int(SplitSlider.value))
            var splittotal = total / split

            
            AmountText.frame.origin.x = 16
            AmountText.frame.origin.y = 75
            TipLabel.text = currencyFormatter.stringFromNumber(tip)
            TotalLabel.text = currencyFormatter.stringFromNumber(total)
            SplitTotal.text = currencyFormatter.stringFromNumber(splittotal)
            ResultView.hidden = false
            TipSegment.hidden = false
            SplitSlider.hidden = false
            SplitstrLabel.hidden = false
            SplitLabel.hidden = false
        }
    }

}

