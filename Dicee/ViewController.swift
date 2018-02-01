//
//  ViewController.swift
//  Dicee
//
//  Created by Karan Sagar on 29/01/18.
//  Copyright © 2018 Karan Sagar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    var randomDiceIndex1:Int = 0
    var randomDiceIndex2:Int = 0
    
    //MARK:- Creating array of dices with images name gave on asset folder
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    //MARK :- Character Limit ie. 2 on the UITextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK:- Turn display on feature
        self.textFieldGuess.delegate = self
        UIApplication.shared.isIdleTimerDisabled = true
        
        // DRY Principal (Don't Repeate Yourself)
        // Calling Update Dice Images Function
        updatedDiceImages()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Create a RollButton Press process
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        //MARK:- Calling Dice Function
        updatedDiceImages()
        
        textFieldShouldReturn(textFieldGuess)
    }
    
    //MARK:- Create a function of changing images of dice
    func updatedDiceImages() {
        
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
        //MARK:- Creating an addition to the random dice outputs
        let dice1total = randomDiceIndex1 + 1
        print("Dice 1:- \(dice1total)")
        
        let dice2total = randomDiceIndex2 + 1
        print("Dice 2:- \(dice2total)")
        
        let totalDiceResult = dice1total + dice2total
        results.text = String(totalDiceResult)
        
        
        //MARK:- Created if else on giving user Win OR Lost Display
        if Int(textFieldGuess.text!) == Int(totalDiceResult) {
            winORLoseLabel.text = "Win"
            print("Sucess")
        } else if Int(textFieldGuess.text!) == 0 || Int(textFieldGuess.text!) == 1 {
            winORLoseLabel.text = "Invalid Number"
        } else {
            winORLoseLabel.text = "Lost"
            print("Lost")
        }
    }
    
    @IBOutlet weak var results: UILabel!
    @IBOutlet weak var textFieldGuess: UITextField!
    @IBOutlet weak var winORLoseLabel: UILabel!
    
    //MARK:- Hide KeyBoard when user touch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldGuess.resignFirstResponder()
        return (true)
    }
    
    // Adding Shake Gesture
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updatedDiceImages()
    }
    
}
