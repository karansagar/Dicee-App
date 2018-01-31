//
//  ViewController.swift
//  Dicee
//
//  Created by Karan Sagar on 29/01/18.
//  Copyright © 2018 Karan Sagar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1:Int = 0
    var randomDiceIndex2:Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps.
    }
    
    //Calls this function when the tap is recognized.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
        let dice1total = randomDiceIndex1 + 1
        print("Dice 1:- \(dice1total)")
    
        let dice2total = randomDiceIndex2 + 1
        print("Dice 2:- \(dice2total)")
        
        let totalDiceResult = dice1total + dice2total
        
        results.text = String(totalDiceResult)
        
        if Int(textFieldGuess.text!) == Int(totalDiceResult) {
            winORLoseLabel.text = "Win"
            print("Sucess")
        } else {
            
            winORLoseLabel.text = "Lost"
            print("Lost")
        }
        
    }
    
    @IBOutlet weak var results: UILabel!
    
    @IBOutlet weak var textFieldGuess: UITextField!
    
    @IBOutlet weak var winORLoseLabel: UILabel!
    
}

