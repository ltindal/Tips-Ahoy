//
//  ViewController.swift
//  Tipster 2
//
//  Created by Lauren Tindal on 9/7/16.
//  Copyright © 2016 Lauren Tindal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var roundButton: UIButton!
    @IBOutlet weak var splitBounce: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        roundButton.layer.cornerRadius = 5
        
        animateButton()
    }
    
    func animateButton() {
        splitBounce.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.5,initialSpringVelocity: 1.0, options: UIViewAnimationOptions.AllowUserInteraction,animations: { self.splitBounce.transform = CGAffineTransformIdentity
            }, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func venmoOpen(sender: AnyObject) {
        if let url = NSURL(string: "https://venmo.com/?txn=pay&audience=friends") {
            UIApplication.sharedApplication().openURL(url) }
    }
    
   
    @IBAction func paypalOpen(sender: AnyObject) {
        if let url = NSURL(string: "https://www.paypal.com/signin/") {
            UIApplication.sharedApplication().openURL(url) }
        }
    
    
    @IBAction func squareOpen(sender: AnyObject) {
        if let url = NSURL(string: "https://cash.me/login") {
            UIApplication.sharedApplication().openURL(url) }
    }
    

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.18,0.2,0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
    }
}

