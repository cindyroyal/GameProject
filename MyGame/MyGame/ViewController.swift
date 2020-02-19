//
//  ViewController.swift
//  MyGame
//
//  Created by Royal, Cindy L on 2/13/20.
//  Copyright © 2020 Royal, Cindy L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var name:String = ""
    var chars:Int = Int(arc4random_uniform(10) + 2)
var score:Int = 0
    
    var counter:Int = 30
    var timer = Timer()
    var isTimerRunning:Bool = false //This will be used to make sure only one timer is created at a time.
    @IBOutlet weak var myTimer: UILabel!
    
    
    
    @IBOutlet weak var alienButton: UIButton!
    
    @IBOutlet weak var predatorButton: UIButton!
    @IBOutlet weak var myScore: UILabel!
    @IBOutlet weak var myName: UITextField!
    
    @IBOutlet weak var myGreeting: UILabel!
    
    @IBAction func mySubmit(_ sender: Any) {
        name = myName.text!
          
        myGreeting.text = "Welcome, \(name)"
        myName.resignFirstResponder()
        
    }
    
    @IBAction func myPredator(_ sender: Any) {
        didScore(points:5)
        if isTimerRunning == false {
        runTimer()
        }
    }
    @IBAction func myAlien(_ sender: Any) {
        didScore(points:1)
        if isTimerRunning == false {
        runTimer()
        }
    }
    
    func didScore(points:Int){
       score = score + points
         if(score % chars == 0) {
               score=0
        }
       myScore.text = "Score: \(score)"
    }
    
    func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
            isTimerRunning = true
                }
        
    @objc func updateTimer() {
            counter -= 1
            myTimer.text = "\(counter)"
            if(counter == 0) {
                myTimer.text = "Time's Up!"
                timer.invalidate()

            alienButton.isHidden = true
            predatorButton.isHidden = true

            }
        }
    
    
    @IBAction func myRestart(_ sender: Any) {
        score = 0
               myScore.text = "Score: \(score)"
               timer.invalidate()
               counter = 30
               myTimer.text = "\(counter)"
               isTimerRunning = false
               alienButton.isHidden = false
               predatorButton.isHidden = false
               chars = Int(arc4random_uniform(10) + 2) 
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

