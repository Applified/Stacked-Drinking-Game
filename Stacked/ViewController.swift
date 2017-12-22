//
//  ViewController.swift
//  Stacked
//
//  Created by Dylan McGoldrick on 4/8/17.
//  Copyright © 2017 Applifier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let defaults2 = UserDefaults.standard
    var counter = 1
    var drinkLvl = 0
    var state = false
    var test = false
    var test2 = false
    var matureMode = false
    
    var images: [UIImage]!
    var animatedImage: UIImage!
    let cup11 = UIImage(named: "1-1")
    let cup12 = UIImage(named: "1-2")
    let cup13 = UIImage(named: "1-3")
    let cup14 = UIImage(named: "1-4")
    let cup15 = UIImage(named: "1-5")
    let cup16 = UIImage(named: "1-6")
    
    var images2: [UIImage]!
    var animatedImage2: UIImage!
    let cup21 = UIImage(named: "2-1")
    let cup22 = UIImage(named: "2-2")
    let cup23 = UIImage(named: "2-3")
    let cup24 = UIImage(named: "2-4")
    let cup25 = UIImage(named: "2-5")
    let cup26 = UIImage(named: "2-6")
    
    var images3: [UIImage]!
    var animatedImage3: UIImage!
    let cup31 = UIImage(named: "3-1")
    let cup32 = UIImage(named: "3-2")
    let cup33 = UIImage(named: "3-3")
    let cup34 = UIImage(named: "3-4")
    let cup35 = UIImage(named: "3-5")
    let cup36 = UIImage(named: "3-6")
    
    var images4: [UIImage]!
    var animatedImage4: UIImage!
    let cup41 = UIImage(named: "4-1")
    let cup42 = UIImage(named: "4-2")
    let cup43 = UIImage(named: "4-3")
    let cup44 = UIImage(named: "4-4")
    let cup45 = UIImage(named: "4-5")
    let cup46 = UIImage(named: "4-6")
    
    var images5: [UIImage]!
    var animatedImage5: UIImage!
    let cup51 = UIImage(named: "5-1")
    let cup52 = UIImage(named: "5-2")
    let cup53 = UIImage(named: "5-3")
    let cup54 = UIImage(named: "5-4")
    let cup55 = UIImage(named: "5-5")
    let cup56 = UIImage(named: "5-6")
    
    @IBOutlet weak var cup0: UIImageView!
    @IBOutlet weak var table: UIImageView!
    @IBOutlet weak var cards: UIButton!
    let redCards = UIImage(named: "Kings cup")
    let greenCards = UIImage(named: "Mature green cards")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = [cup11!, cup12!, cup13!, cup14!, cup15!, cup16!]
        animatedImage = UIImage.animatedImage(with: images, duration: 0.4)
        
        images2 = [cup21!, cup22!, cup23!, cup24!, cup25!, cup26!]
        animatedImage2 = UIImage.animatedImage(with: images2, duration: 0.4)
        
        images3 = [cup31!, cup32!, cup33!, cup34!, cup35!, cup36!]
        animatedImage3 = UIImage.animatedImage(with: images3, duration: 0.4)
        
        images4 = [cup41!, cup42!, cup43!, cup44!, cup45!, cup46!]
        animatedImage4 = UIImage.animatedImage(with: images4, duration: 0.4)
        
        images5 = [cup51!, cup52!, cup53!, cup54!, cup55!, cup56!, cup55!, cup53!]
        animatedImage5 = UIImage.animatedImage(with: images5, duration: 0.4)
        
        drinkLvl = defaults.integer(forKey: "intKey")
        if(counter == 0){
            drinkLvl = 0
            saveVar()
            if(state == true){
                defaults.set(state, forKey: "gameType")
                state = defaults.bool(forKey: "gameType")
            } else if (state == false && matureMode == false){
                defaults.set(state, forKey: "gameType")
                state = defaults.bool(forKey: "gameType")
            } else if(state == false && matureMode == true){
                defaults.set(state, forKey: "gameType")
                state = defaults.bool(forKey: "gameType")
                defaults2.set(matureMode, forKey: "gameType2")
                matureMode = defaults2.bool(forKey: "gameType2")
        }
        
        } else if(counter == 1){
            state = defaults.bool(forKey: "gameType")
        }
        if(test == true){
            cards.setImage(redCards, for: UIControlState(rawValue: 0))
            check()
        }
        if(test2 == true){
            cup0.image = UIImage(named: "")
            table.image = UIImage(named: "")
        }
        if(test2 == true && matureMode == true){
            cards.setImage(greenCards, for: UIControlState(rawValue: 0))
        }
    }
    
    func saveVar(){
        defaults.set(drinkLvl, forKey: "intKey")
        defaults.synchronize()
    }
    
    func check(){
        if(drinkLvl == 1){
            cup0.image = animatedImage
        }
        else if(drinkLvl == 2){
            cup0.image = animatedImage2
        }
        else if(drinkLvl == 3){
            cup0.image = animatedImage3
        }
        else if(drinkLvl == 4){
            cup0.image = animatedImage4
        }
        else if(drinkLvl == 5){
            cup0.image = animatedImage5
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(test == true){
            if(segue.identifier != "add sip" && segue.identifier != "your life sucks" && segue.identifier !=  "back to modes" && segue.identifier != "guessing game"){
                let secondViewController = segue.destination as! CardViewController
                secondViewController.test3 = true
            }
            if(segue.identifier == "guessing game"){
                let secondViewController = segue.destination as! GuessingGameViewController
                secondViewController.test3 = true
            }
        }
        if(matureMode == true){
            if(segue.identifier != "add sip" && segue.identifier != "your life sucks" && segue.identifier !=  "back to modes" && segue.identifier != "guessing game"){
                let secondViewController = segue.destination as! CardViewController
                secondViewController.test4 = true
            }
            if(segue.identifier == "guessing game"){
                let secondViewController = segue.destination as! GuessingGameViewController
                secondViewController.test4 = true
            }
        }
    }
    
    // CARDS FOR REGULAR PLAY
    // let segues = ["dios", "make a rule", "medusa", "medusa", "thumb", "thumb", "question", "question", "bad words", "1 in 5", "waterfall", "fuck off", "attendance", "categories", "rhyme", "never have i ever", "soundtrack", "share wealth", "sobriety", "class clown", "heroes", "story time", "name game", "real friends", "bad luck", "insta-hoe", "follow me", "snap thief", "color wheel", "daddy", "sober state", "drunken immunity", "lightly salted", "most likely", "tinder", "trivia", "listen carefully", "guessing game", "guessing game", "rock paper scissors", "staring contest", "shitty manners", "truth or drink", "buffalo", "gecko", "time bomb", "double fisting", "obscene", "hard liquor", "t-rex", "popularity", "shame thing", "to the point", "loser looks"]
    
    @IBAction func drawCard(_ sender: Any) {
        // REGULAR MODE - 51 Cards
        if(state == false && matureMode == false){
            let segues = ["dios", "make a rule", "medusa", "medusa", "thumb", "thumb", "question", "question", "bad words", "1 in 5", "waterfall", "fuck off", "attendance", "categories", "rhyme", "never have i ever", "soundtrack", "share wealth", "sobriety", "class clown", "heroes", "story time", "name game", "real friends", "bad luck", "insta-hoe", "follow me", "snap thief", "color wheel", "daddy", "sober state", "drunken immunity", "lightly salted", "most likely", "tinder", "trivia", "listen carefully", "guessing game", "guessing game", "rock paper scissors", "staring contest", "shitty manners", "truth or drink", "buffalo", "gecko", "time bomb", "double fisting", "obscene", "hard liquor", "t-rex", "popularity", "shame thing", "to the point", "loser looks"]
            let index = Int(arc4random_uniform(UInt32(segues.count)))
            let segueName = segues[index]
            self.performSegue(withIdentifier: segueName, sender: self)
        }
        // MATURE MODE X 2 RESET CARDS
        // ADDITIONAL SEGUES ["reset", "reset", "dios", "make a rule", "medusa", "medusa", "thumb", "thumb", "question", "question", "bad words", "1 in 5", "waterfall", "fuck off", "attendance", "categories", "rhyme", "never have i ever",  "share wealth", "sobriety", "class clown", "heroes", "story time", "real friends", "bad luck", "insta-hoe", "follow me", "snap thief", "color wheel", "daddy", "sober state", "drunken immunity", "lightly salted", "most likely", "tinder", "listen carefully", "guessing game", "guessing game", "rock paper scissors", "staring contest", "shitty manners", "truth or drink", "buffalo", "gecko", "time bomb", "double fisting", "obscene", "hard liquor", "t-rex", "popularity", "shame thing", "to the point", "loser looks", "shirt swap", "class hoe", "off we go", "no shirt no shoes", "physical", "fresh meat", "neighborhood", "turn and cough", "odds are", "quick strip", "naked immunity", "hazing", "body shot", "strip trivia", "strip name game", "rock paper strippers", "nose goes", "sword", "matchmaking", "shirt thief", "getting comfortable", "sound strip", "santas gift", "bust a move", "baby needs his bottle", "mind your manners", "hands across america", "assistant", "things ive seen", "hannahs intellect"]
        
        if (state == false && matureMode == true){
            let segues = ["reset", "reset", "dios", "make a rule", "medusa", "medusa", "thumb", "thumb", "question", "question", "bad words", "1 in 5", "waterfall", "fuck off", "attendance", "categories", "rhyme", "never have i ever",  "share wealth", "sobriety", "class clown", "heroes", "story time", "real friends", "bad luck", "insta-hoe", "follow me", "snap thief", "color wheel", "daddy", "sober state", "drunken immunity", "lightly salted", "most likely", "tinder", "listen carefully", "guessing game", "guessing game", "rock paper scissors", "staring contest", "shitty manners", "truth or drink", "buffalo", "gecko", "time bomb", "double fisting", "obscene", "hard liquor", "t-rex", "popularity", "shame thing", "to the point", "loser looks", "shirt swap", "class hoe", "off we go", "no shirt no shoes", "physical", "fresh meat", "neighborhood", "turn and cough", "odds are", "quick strip", "naked immunity", "hazing", "body shot", "strip trivia", "strip name game", "rock paper strippers", "nose goes", "sword", "matchmaking", "shirt thief", "getting comfortable", "sound strip", "santas gift", "bust a move", "baby needs his bottle", "mind your manners", "hands across america", "assistant", "things ive seen", "hannahs intellect"]
            let index = Int(arc4random_uniform(UInt32(segues.count)))
            let segueName = segues[index]
            self.performSegue(withIdentifier: segueName, sender: self)
        }
        
        // DEATH CUP MODE X 10 ADD_SIP CARDS
        if(state == true){
            
            if(drinkLvl < 5){
            let segues = ["add sip", "add sip", "add sip", "add sip", "add sip", "add sip", "add sip", "add sip", "add sip", "add sip", "dios", "make a rule", "medusa", "medusa", "thumb", "thumb", "question", "question", "bad words", "1 in 5", "waterfall", "fuck off", "attendance", "categories", "rhyme", "never have i ever", "soundtrack", "share wealth", "sobriety", "class clown", "heroes", "story time", "name game", "real friends", "bad luck", "insta-hoe", "follow me", "snap thief", "color wheel", "daddy", "sober state", "drunken immunity", "lightly salted", "most likely", "tinder", "trivia", "listen carefully", "guessing game", "guessing game", "rock paper scissors", "staring contest", "shitty manners", "truth or drink", "buffalo", "gecko", "time bomb", "double fisting", "obscene", "hard liquor", "t-rex", "popularity", "shame thing", "to the point", "loser looks"]
            let index = Int(arc4random_uniform(UInt32(segues.count)))
            let segueName = segues[index]
            if(segueName == "add sip"){
                drinkLvl = drinkLvl + 1
                saveVar()
            }
            self.performSegue(withIdentifier: segueName, sender: self)
                
            } else {
                let segues = ["your life sucks", "your life sucks", "your life sucks", "your life sucks", "your life sucks", "your life sucks", "your life sucks", "your life sucks", "your life sucks", "dios", "make a rule", "medusa", "medusa", "thumb", "thumb", "question", "question", "bad words", "1 in 5", "waterfall", "fuck off", "attendance", "categories", "rhyme", "never have i ever", "soundtrack", "share wealth", "sobriety", "class clown", "heroes", "story time", "name game", "real friends", "bad luck", "insta-hoe", "follow me", "snap thief", "color wheel", "daddy", "sober state", "drunken immunity", "lightly salted", "most likely", "tinder", "trivia", "listen carefully", "guessing game", "guessing game", "rock paper scissors", "staring contest", "shitty manners", "truth or drink", "buffalo", "gecko", "time bomb", "double fisting", "obscene", "hard liquor", "t-rex", "popularity", "shame thing", "to the point", "loser looks"]
                let index = Int(arc4random_uniform(UInt32(segues.count)))
                let segueName = segues[index]
                if(segueName == "your life sucks"){
                    drinkLvl = 0
                    saveVar()
                }
                self.performSegue(withIdentifier: segueName, sender: self)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

