//
//  ViewController.swift
//  MadNibs
//
//  Created by Paul Sevilla on 1/5/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var pastTenseVerbTextField: UITextField!
  @IBOutlet weak var singularNounTextField: UITextField!
  @IBOutlet weak var pluralNounTextField: UITextField!
  @IBOutlet weak var phraseTextField: UITextField!
  @IBOutlet weak var sliderLabel: UILabel!
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var resultsTextView: UITextView!
  @IBOutlet weak var placeSegmentedControl: UISegmentedControl!
  
  var textFields: [UITextField]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textFields = [pastTenseVerbTextField, singularNounTextField, pluralNounTextField, phraseTextField]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func goTapped(sender: AnyObject) {
    var placeString = placeSegmentedControl.titleForSegmentAtIndex(placeSegmentedControl.selectedSegmentIndex)
    resultsTextView.text = "One day, at \(placeString!) a \(singularNounTextField.text) \(pastTenseVerbTextField.text) \(slider.value) \(pluralNounTextField.text) and said \(phraseTextField.text)"
    
  }

  @IBAction func sliderChanged(sender: AnyObject) {
    sliderLabel.text = "\(Int(slider.value))"
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    let textFieldArray = textFields as NSArray
    let i = textFieldArray.indexOfObject(textField)
    if i < textFieldArray.count - 1 {
      let newTextField = textFieldArray[i + 1] as UITextField
      newTextField.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
    }
    return true
  }
  
}

