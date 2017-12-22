//
//  GuessingGameViewController.swift
//  Stacked
//
//  Created by Dylan McGoldrick on 4/24/17.
//  Copyright © 2017 Applifier. All rights reserved.
//

import UIKit

class GuessingGameViewController: UIViewController {

    @IBOutlet weak var word: UITextField!
    var test3 = false
    var test4 = false
    
    @IBAction func go(_ sender: Any) {
        //let myVC = storyboard?.instantiateViewController(withIdentifier: "GuessingGame2ViewController") as! GuessingGame2ViewController
        //myVC.stringPassed = word.text!
        //navigationController?.pushViewController(myVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! GuessingGame2ViewController
        secondViewController.stringPassed = word.text!
        if(test3 == true){
            secondViewController.test3 = true
        }
        if(test4 == true){
            secondViewController.test4 = true
        }
    }
    
}
