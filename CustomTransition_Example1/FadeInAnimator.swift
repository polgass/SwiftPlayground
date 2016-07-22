//
//  FadeInAnimator.swift
//  CustomSegue_Example1
//
//  Created by Colin  on 22/07/2016.
//  Copyright © 2016 Colin . All rights reserved.
//

import UIKit

class FadeInAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 0.35
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    
    guard let containerView = transitionContext.containerView(),
    fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
    toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
      return
    }
   
    containerView.addSubview(toVC.view)
    toVC.view.alpha = 0.0
    
    let duration = transitionDuration(transitionContext)
    
    UIView.animateWithDuration(duration, animations: { 
      toVC.view.alpha = 1.0
      }) { finished in
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
    }
    
  }
  
}
