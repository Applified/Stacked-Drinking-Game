//
//  CardViewController.swift
//  Stacked
//
//  Created by Dylan McGoldrick on 4/20/17.
//  Copyright © 2017 Applifier. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    var test3 = false
    var test4 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
