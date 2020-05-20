//
//  gamePlayViewController.swift
//  Random Number Game
//
//  Created by Help Desk on 1/28/20.
//  Copyright © 2020 Jason Baldwin. All rights reserved.
//

import UIKit

class gamePlayViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)
    
    
    
    var num1 = 0
    var num2 = 0
    let minRand = 1
    let maxRand = 10
    var score = 0
    
    var timeLeft:Float = 2.0
    var givenTime:Float = 2.0
    var progress: Float = 1.0
    var answer = false
    var timeStep:Float  = 0.02
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    
    
    func checkUserAnswer(){
        if answer == (num1 > num2){
            score += 1
            scoreLabel.text = "Score: \(score)"
            resetGaem()
        }
        else{
            performSegue(withIdentifier: "goBack", sender: self)
        }
    }
    
    @IBAction func trueDidTouch(_ sender: UIButton) {
        answer = true
        checkUserAnswer()
    }
    
    @IBAction func falseDidTouch(_ sender: UIButton) {
        //performSegue(withIdentifier: "goBack", sender: self)
        answer = false
        checkUserAnswer()
    }
    
    func setup(){
        score = 0
        resetGaem()
        gameLoop()
        
    }
    
    
    @IBAction func pauseButtonClicked(_ sender: Any) {
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @objc func gameLoop(){
        timeLeft -= timeStep
        progress = timeLeft/givenTime
        progressView.setProgress(progress, animated: false)
        
        if timeLeft <= 0 {
            performSegue(withIdentifier: "goBack", sender: self)
        }
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(timeStep), target: self, selector: #selector(gameLoop), userInfo: nil, repeats: false)
        
        
        
    }
    
    func resetGaem(){
        num1 = Int(arc4random_uniform(UInt32(maxRand-minRand)))+minRand
        num2 = Int(arc4random_uniform(UInt32(maxRand-minRand)))+minRand
        
        numLabel.text = "\(num1) > \(num2)"
        
        timeLeft = givenTime
        progress = 1.0
        progressView.setProgress(progress, animated: false)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goBack"{
            let dest = segue.destination as! ViewController
            dest.previousScore = score
            dest.testVar = 223
            //var test = segue.destination as! ViewController
            //test.testVar = 123456
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
