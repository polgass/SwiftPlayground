//
//  NavigationControllerDelegate.swift
//  CustomSegue_Example1
//
//  Created by Colin  on 22/07/2016.
//  Copyright © 2016 Colin . All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {

  func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return FadeInAnimator()
  }
  
}
