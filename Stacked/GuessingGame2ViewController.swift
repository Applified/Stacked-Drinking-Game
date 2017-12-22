//
//  GuessingGame2ViewController.swift
//  Stacked
//
//  Created by Dylan McGoldrick on 4/24/17.
//  Copyright © 2017 Applifier. All rights reserved.
//

import UIKit

class GuessingGame2ViewController: UIViewController {

    @IBOutlet weak var guessWord: UILabel!
    var stringPassed = ""
    var test3 = false
    var test4 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessWord.text = stringPassed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! ViewController
        if(test3 == true){
            secondViewController.test = true
        }
        else if(test4 == true){
            secondViewController.matureMode = true
            secondViewController.test2 = true
        }
        else {
            secondViewController.test2 = true
        }
    }

}
