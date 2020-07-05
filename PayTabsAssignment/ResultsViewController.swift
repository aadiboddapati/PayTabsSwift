//
//  ResultsViewController.swift
//  PayTabsAssignment
//
//  Created by chiranjeevi macharla on 04/07/20.
//  Copyright © 2020 Adinarayana. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var responseLbl: UILabel!
    var result: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        responseLbl.text = result
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
