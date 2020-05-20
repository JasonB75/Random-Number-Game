//
//  ViewController.swift
//  Random Number Game
//
//  Created by Help Desk on 1/13/20.
//  Copyright © 2020 Jason Baldwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var previousScoreLabel: UILabel!
    
    var previousScore = 0
    var testVar = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func unWindToMainScreen(segue: UIStoryboardSegue){
        previousScoreLabel.text = "Previous Score: \(previousScore) ++  \(testVar)"
    }

}

