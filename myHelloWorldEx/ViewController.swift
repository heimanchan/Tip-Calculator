//
//  ViewController.swift
//  myHelloWorldEx
//
//  Created by Heiman Chan on 6/12/19.
//  Copyright © 2019 Heiman Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var greetingLabel : UILabel!
  @IBAction func greetingButton(sender:UIButton) {
    greetingLabel.text = "Hi!"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

