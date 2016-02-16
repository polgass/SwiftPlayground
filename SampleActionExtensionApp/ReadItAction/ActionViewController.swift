//
//  ActionViewController.swift
//  ReadItAction
//
//  Created by Peter Paul Sevilla on 06/11/2015.
//  Copyright © 2015 Peter Paul Sevilla. All rights reserved.
//

import AVFoundation
import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {
  
  @IBOutlet weak var textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Get the item[s] we're handling from the extension context.
    let item = extensionContext!.inputItems[0] as! NSExtensionItem
    let itemProvider = item.attachments![0] as! NSItemProvider
    
    if itemProvider.hasItemConformingToTypeIdentifier(kUTTypePlainText as String) {
      
      // It's a plain text!
      weak var textView = self.textView
      
      itemProvider.loadItemForTypeIdentifier(kUTTypePlainText as String, options: nil, completionHandler: { (item, error) -> Void in
        
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
          textView!.text = item as! String
          
          // Set up speech synthesizer and start it
          let synthesizer = AVSpeechSynthesizer()
          let utterance = AVSpeechUtterance(string: textView!.text)
          utterance.rate = 0.1
          synthesizer.speakUtterance(utterance)
        })
        
        /*
        if (item) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        [textView setText:item];
        
        // Set up speech synthesizer and start it
        AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:textView.text];
        [utterance setRate:0.1];
        [synthesizer speakUtterance:utterance];
        }];
        }
        */
      })
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func done() {
    // Return any edited content to the host app.
    // This template doesn't do anything, so we just echo the passed in items.
    self.extensionContext!.completeRequestReturningItems(self.extensionContext!.inputItems, completionHandler: nil)
  }
  
}
