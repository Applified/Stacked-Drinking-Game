//
//  RuleViewController.swift
//  Stacked
//
//  Created by Dylan McGoldrick on 4/20/17.
//  Copyright © 2017 Applifier. All rights reserved.
//

import UIKit

class RuleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! ViewController
        secondViewController.test = true
    }
}
