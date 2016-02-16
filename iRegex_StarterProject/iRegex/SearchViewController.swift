//
//  SearchViewController.swift
//  iRegex
//
//  Created by James Frost on 11/10/2014.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  
  struct Storyboard {
    struct Identifiers {
      static let SearchOptionsSegueIdentifier = "SearchOptionsSegue"
    }
  }
  
  var searchOptions: SearchOptions?
  
  @IBOutlet weak var textView: UITextView!
  
  @IBAction func unwindToTextHighlightViewController(segue: UIStoryboardSegue) {
    if let searchOptionsViewController = segue.sourceViewController as? SearchOptionsViewController {
      if let options = searchOptionsViewController.searchOptions {
        performSearchWithOptions(options)
      }
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier == Storyboard.Identifiers.SearchOptionsSegueIdentifier) {
      if let options = self.searchOptions {
        if let navigationController = segue.destinationViewController as? UINavigationController {
          if let searchOptionsViewController = navigationController.topViewController as? SearchOptionsViewController {
            searchOptionsViewController.searchOptions = options
          }
        }
      }
    }
  }
  
  //MARK: Text highlighting, and Find and Replace
  
  func performSearchWithOptions(searchOptions: SearchOptions) {
    self.searchOptions = searchOptions
    
    if let replacementString = searchOptions.replacementString {
      searchForText(searchOptions.searchString, replaceWith: replacementString, inTextView: textView)
    } else {
      highlightText(searchOptions.searchString, inTextView: textView)
    }
  }
  
  func searchForText(searchText: String, replaceWith replacementText: String, inTextView textView: UITextView) {
  }
  
  func highlightText(searchText: String, inTextView textView: UITextView) {
  }
  
  func rangeForAllTextInTextView() -> NSRange {
    return NSMakeRange(0, textView.text.characters.count)
  }
  
  //MARK: Underline dates, times, and locations
  
  @IBAction func underlineInterestingData(sender: AnyObject) {
    underlineAllDates()
    underlineAllTimes()
    underlineAllLocations()
  }
  
  func underlineAllDates() {
  }
  
  func underlineAllTimes() {
  }
  
  func underlineAllLocations() {
  }
  
  func matchesForRegularExpression(regex: NSRegularExpression, inTextView textView: UITextView) -> [NSTextCheckingResult] {
    let string = textView.text
    let range = rangeForAllTextInTextView()
    
    return regex.matchesInString(string, options: [], range: range) 
  }
  
  func highlightMatches(matches: [NSTextCheckingResult]) {
    let attributedText = textView.attributedText.mutableCopy() as! NSMutableAttributedString
    let attributedTextRange = NSMakeRange(0, attributedText.length)
    attributedText.removeAttribute(NSBackgroundColorAttributeName, range: attributedTextRange)
    
    for match in matches {
      let matchRange = match.range
      attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: matchRange)
      attributedText.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: matchRange)
    }
    
    textView.attributedText = attributedText.copy() as! NSAttributedString
  }
}
