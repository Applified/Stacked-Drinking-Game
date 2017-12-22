//
//  ModeViewController.swift
//  Stacked
//
//  Created by Dylan McGoldrick on 4/19/17.
//  Copyright © 2017 Applifier. All rights reserved.
//

import UIKit
import StoreKit

// Product id: "com.wordpress.Stacked.Pregame"

class ModeViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
    @IBOutlet weak var regularBtn: UIButton!
    
    @IBOutlet weak var deathCupBtn: UIButton!
    
    @IBOutlet weak var teamBtn: UIButton!
    
    @IBOutlet weak var theView: UIView!
    
    @IBOutlet weak var matureBtn: UIButton!
    //SENDS TO REAL MODE
    
    @IBOutlet weak var preMatureBtn: UIButton!
    //DISPLAYS IN-APP PURCHASE
    
    @IBOutlet weak var buyBtn: UIButton!
    
    @IBOutlet weak var matureLbl: UILabel!
    
    let defaults3 = UserDefaults.standard
    var purchased = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load if purchased or not
        purchased = defaults3.bool(forKey: "bought")
        if(purchased == true){
            matureBtn.isHidden = false
            preMatureBtn.isHidden = true
        } else {
            preMatureBtn.isHidden = false
            matureBtn.isHidden = true
        }
        //NEW STUFF
        if(SKPaymentQueue.canMakePayments()) {
            print("IAP is enabled, loading")
            let productID: NSSet = NSSet(objects: "com.wordpress.Stacked.Pregame")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            print("please enable IAPS")
        }
        //END
    }
    
    //NEW STUFF
    @IBAction func btnRestorePurchases(_ sender: Any) {  //Function Not Used
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    func buyProduct() {
        print("buy " + p.productIdentifier)
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    
    func removeAds() { //Code to actually unlock Mature Mode
        purchased = true
        matureBtn.isHidden = false
        preMatureBtn.isHidden = true
        
        //Save "purchased" boolean value
        defaults3.set(purchased, forKey: "bought")
        
        //Then go back to view
        UIView.animate(withDuration: 0.4, animations: {
            self.theView.frame.origin.y = 700 })
    }
    
    var list = [SKProduct]()
    var p = SKProduct()
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("product request")
        let myProduct = response.products
        for product in myProduct {
            print("product added")
            print(product.productIdentifier)
            print(product.localizedTitle)
            print(product.localizedDescription)
            print(product.price)
            list.append(product)
        }
        
        //Change the button price here
        var item = SKProduct()
        for i in list{
            if i.productIdentifier == "com.wordpress.Stacked.Pregame" {
                item = i
                if let formattedPrice = priceStringForProduct(item: item) {
                    buyBtn.setTitle("GET FOR \(formattedPrice)", for: .normal)
                }
            }
        }
        
    }
    
    func priceStringForProduct(item: SKProduct) -> String? {
        let price = item.price
        if price == 0 {
            return "Free!" //or whatever you like
        } else {
            let numberFormatter = NumberFormatter()
            let locale = item.priceLocale
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = locale
            return numberFormatter.string(from: price)
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        print("transactions restored")
        for transaction in queue.transactions {
            let t: SKPaymentTransaction = transaction
            let prodID = t.payment.productIdentifier as String
            
            switch prodID {
            case "com.wordpress.Stacked.Pregame":
                print("Unlock Mature Mode")
                removeAds()
            case "seemu.iap.addcoins":
                print("add coins to account")
            default:
                print("IAP not found")
            }
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("add payment")
        
        for transaction: AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            print(trans.error)
            
            switch trans.transactionState {
            case .purchased:
                print("buy ok, unlock IAP HERE")
                print(p.productIdentifier)
                
                let prodID = p.productIdentifier
                switch prodID {
                case "com.wordpress.Stacked.Pregame":
                    print("remove ads")
                    removeAds()
                case "seemu.iap.addcoins":
                    print("add coins to account")
                default:
                    print("IAP not found")
                }
                queue.finishTransaction(trans)
            case .failed:
                print("buy error")
                queue.finishTransaction(trans)
                break
            default:
                print("Default")
                break
            }
        }
    }
    //END
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func purchaseBtn(_ sender: Any) {
        //Begin in-app purchasing process
        //NEW STUFF
        print("Unlock Mature Mode")
        for product in list {
            let prodID = product.productIdentifier
            if(prodID == "com.wordpress.Stacked.Pregame") {
                p = product
                buyProduct()
            }
        }
        //END
    }
    
    @IBAction func goToItem(_ sender: Any) {
        UIView.animate(withDuration: 0.4, animations: {
            self.theView.frame.origin.y = 0
        }
        )
    }
    
    @IBAction func goBack(_ sender: Any) {
        UIView.animate(withDuration: 0.4, animations: {
            self.theView.frame.origin.y = 750
        }
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier != "premature segue"){
        let secondViewController = segue.destination as! ViewController
        secondViewController.counter = 0
        if segue.identifier == "regular" {
            secondViewController.state = false
            secondViewController.test2 = true
        } else if segue.identifier == "death cup" {
            secondViewController.state = true
            secondViewController.test = true
        } else if segue.identifier == "mature mode" {
            secondViewController.matureMode = true
            secondViewController.state = false
            secondViewController.test2 = true
        }
      }
    }

}
