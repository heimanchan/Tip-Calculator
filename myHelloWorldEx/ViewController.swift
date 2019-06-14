//
//  ViewController.swift
//  myHelloWorldEx
//
//  Created by Heiman Chan on 6/12/19.
//  Copyright © 2019 Heiman Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  @IBOutlet weak var tenPercentLabel : UILabel!
  @IBOutlet weak var fifteenPercentLabel : UILabel!
  @IBOutlet weak var twentyPercentLabel : UILabel!
  @IBOutlet weak var subtotalTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    subtotalTextField.delegate = self
    
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
      target: self.view,
      action: #selector(UIView.endEditing(_:))
    )
//    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
    
    
    
    // Listen for keyboard events
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillChange(notification:)),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillChange(notification:)),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
    
    NotificationCenter.default.addObserver(self,
      selector: #selector(keyboardWillChange(notification:)),
      name: UIResponder.keyboardWillChangeFrameNotification,
      object: nil
    )
  }
  
  deinit {
    NotificationCenter.default.removeObserver(
      self,
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
    
    NotificationCenter.default.removeObserver(
      self,
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
    
    NotificationCenter.default.removeObserver(
      self,
      name: UIResponder.keyboardWillChangeFrameNotification,
      object: nil
    )
  }
  
  // Actions
  @IBAction func calculateButtonPressed(_ sender: Any) {
    print("Calculate Button Clicked")
    hideKeyboard()
    calculateAllTips()
  }
  
  // Functions
  // UIDelegate funcs
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    print("Pressed return")
    hideKeyboard()
    calculateAllTips()
    return true
  }
  
  func hideKeyboard() {
    subtotalTextField.resignFirstResponder()
  }
  
  func calculateAllTips() {
    guard let subtotal = convertCurrencyToDouble(input: subtotalTextField.text!) else {
      print("not a number")
      return
    }
    
    print("The subtotal is \(subtotal)")
    
    // Calculate tips
    let tip1 = calculateTip(subtotal: subtotal, tipPercentage: 10.0)
    let tip2 = calculateTip(subtotal: subtotal, tipPercentage: 15.0)
    let tip3 = calculateTip(subtotal: subtotal, tipPercentage: 20.0)
    
    // Update UI
    tenPercentLabel.text = String(tip1)
    fifteenPercentLabel.text = String(tip2)
    twentyPercentLabel.text = String(tip3)
  }
  
  // tipPercentage: 10% => 10
  func calculateTip(subtotal: Double, tipPercentage: Double) -> Double {
    return subtotal * (tipPercentage / 100.0)
  }
  
  func convertCurrencyToDouble(input: String) -> Double? {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    numberFormatter.locale = Locale.current
    
    return numberFormatter.number(from: input)?.doubleValue
  }
  
  @objc func keyboardWillChange(notification: Notification) {
    guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
      return
    }
    
    if notification.name == UIResponder.keyboardWillShowNotification ||
      notification.name == UIResponder.keyboardWillChangeFrameNotification {
      view.frame.origin.y = -keyboardRect.height
    } else {
      view.frame.origin.y = 0
    }
  }

}

