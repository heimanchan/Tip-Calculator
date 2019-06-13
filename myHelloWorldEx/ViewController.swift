//
//  ViewController.swift
//  myHelloWorldEx
//
//  Created by Heiman Chan on 6/12/19.
//  Copyright © 2019 Heiman Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tenPercentLabel : UILabel!
  @IBOutlet weak var fifteenPercentLabel : UILabel!
  @IBOutlet weak var twentyPercentLabel : UILabel!
  @IBOutlet weak var subtotalTextField: UITextField!
  
  @IBAction func calculateButtonPressed(_ sender: Any) {
    print("test")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

}

