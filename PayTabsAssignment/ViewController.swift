//
//  ViewController.swift
//  PayTabsAssignment
//
//  Created by chiranjeevi macharla on 03/07/20.
//  Copyright © 2020 Adinarayana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     var paymentSetupViewController: PTFWInitialSetupViewController!
    @IBOutlet weak var checkoutBtn:UIButton!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
    }
    override func viewWillAppear(_ animated: Bool) {
        checkoutBtn.isUserInteractionEnabled = true
    }
    
    // Function to handle Click event for checkout button //
    @IBAction func checkoutBtnAction(_ sender: UIButton) {
        // to avoid multiple interactions with the button
        sender.isUserInteractionEnabled = false
        let bundle = Bundle(url: Bundle.main.url(forResource: "Resources", withExtension: "bundle")!)
        
        self.paymentSetupViewController = PTFWInitialSetupViewController.init(
                 bundle: bundle,
                 andWithViewFrame: self.view.frame,
                 andWithAmount: 10.0,
                 andWithCustomerTitle: "PayTabs Assignment",
                 andWithCurrencyCode: "USD",
                 andWithTaxAmount: 0.0,
                 andWithSDKLanguage: "en",
                 andWithShippingAddress: "Guntur",
                 andWithShippingCity: "Guntur",
                 andWithShippingCountry: "IND",
                 andWithShippingState: "Guntur",
                 andWithShippingZIPCode: "522601",
                 andWithBillingAddress: "Guntur",
                 andWithBillingCity: "Guntur",
                 andWithBillingCountry: "IND",
                 andWithBillingState: "Guntur",
                 andWithBillingZIPCode: "522601",
                 andWithOrderID: "522601",
                 andWithPhoneNumber: "009642095551",
                 andWithCustomerEmail: "test@gmail.com",
                 andIsTokenization:false,
                 andIsPreAuth: false,
                 andWithMerchantEmail: "boddapatiadinarayana@gmail.com",
                 andWithMerchantSecretKey:"7hTPir023yPZoOw79WZB52t89yA4hbbpt5eMwfPzNEzbt6iC2ie8kIgthQyy2KXwPbimq8WeMvqgBITE17MlQ2P7SoFV8DrYOJlf",
                 andWithAssigneeCode: "SDK",
                 andWithThemeColor:UIColor.red,
                 andIsThemeColorLight: false)

        self.paymentSetupViewController.didReceiveBackButtonCallback = {
            sender.isUserInteractionEnabled = true

        }

        self.paymentSetupViewController.didStartPreparePaymentPage = {
            // Start Prepare Payment Page
            // Show loading indicator
        }
        self.paymentSetupViewController.didFinishPreparePaymentPage = {
            // Finish Prepare Payment Page
            // Stop loading indicator
        }

        self.paymentSetupViewController.didReceiveFinishTransactionCallback = {(responseCode, result, transactionID, tokenizedCustomerEmail, tokenizedCustomerPassword, token, transactionState) in
            
            sender.isUserInteractionEnabled = true
            print("Response Code: \(responseCode)")
            print("Response Result: \(result)")

            // In Case you are using tokenization
            print("Tokenization Cutomer Email: \(tokenizedCustomerEmail)");
            print("Tokenization Customer Password: \(tokenizedCustomerPassword)");
            print("TOkenization Token: \(token)");

            // Navigating to Result Controller
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            if let resultController = storyBoard.instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController{
                print(result)
                resultController.result = result
                self.present(resultController, animated:true, completion:nil)
            }
        }

        self.view.addSubview(paymentSetupViewController.view)
        self.addChild(paymentSetupViewController)
        paymentSetupViewController.didMove(toParent: self)
    }
     
}

