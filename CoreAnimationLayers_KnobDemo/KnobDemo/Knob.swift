//
//  Knob.swift
//  KnobDemo
//
//  Created by offshoreadmin on 25/02/2016.
//  Copyright © 2016 Mikael Konutgan. All rights reserved.
//

import UIKit

public class Knob: UIControl {
  
  private var backingValue: Float = 0.0
  private let knobRenderer = KnobRenderer()
  
  /** Contains the receiver’s current value. */
  public var value: Float {
    get { return backingValue }
    set { setValue(newValue, animated: false) }
  }
  
  /** Sets the receiver’s current value, allowing you to animate the change visually. */
  public func setValue(value: Float, animated: Bool) {
    if value != self.value {
      // Save the value to the backing value
      // Make sure we limit it to the requested bounds
      self.backingValue = min(self.maximumValue, max(self.minimumValue, value))
      
      // Now let's update the knob with the correct angle
      let angleRange = endAngle - startAngle
      let valueRange = CGFloat(maximumValue - minimumValue)
      let angle = CGFloat(value - minimumValue) / valueRange * angleRange + startAngle
      knobRenderer.setPointerAngle(angle, animated: animated)
    }
  }
  
  /** Contains the minimum value of the receiver. */
  public var minimumValue: Float = 0.0
  
  /** Contains the maximum value of the receiver. */
  public var maximumValue: Float = 1.0
  
  /** Contains a Boolean value indicating whether changes
   in the sliders value generate continuous update events. */
  public var continuous = true
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    createSublayers()
  }
  
  public required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func createSublayers() {
    knobRenderer.update(bounds)
    knobRenderer.strokeColor = tintColor
    knobRenderer.startAngle = -CGFloat(M_PI * 11.0 / 8.0);
    knobRenderer.endAngle = CGFloat(M_PI * 3.0 / 8.0);
    knobRenderer.pointerAngle = knobRenderer.startAngle;
    knobRenderer.lineWidth = 2.0
    knobRenderer.pointerLength = 6.0
    
    layer.addSublayer(knobRenderer.trackLayer)
    layer.addSublayer(knobRenderer.pointerLayer)
  }
  
  /** Specifies the angle of the start of the knob control track. Defaults to -11π/8 */
  public var startAngle: CGFloat {
    get { return knobRenderer.startAngle }
    set { knobRenderer.startAngle = newValue }
  }
  
  /** Specifies the end angle of the knob control track. Defaults to 3π/8 */
  public var endAngle: CGFloat {
    get { return knobRenderer.endAngle }
    set { knobRenderer.endAngle = newValue }
  }
  
  /** Specifies the width in points of the knob control track. Defaults to 2.0 */
  public var lineWidth: CGFloat {
    get { return knobRenderer.lineWidth }
    set { knobRenderer.lineWidth = newValue }
  }
  
  /** Specifies the length in points of the pointer on the knob. Defaults to 6.0 */
  public var pointerLength: CGFloat {
    get { return knobRenderer.pointerLength }
    set { knobRenderer.pointerLength = newValue }
  }
  
}

private class KnobRenderer {
  
  var strokeColor: UIColor {
    get {
      return UIColor(CGColor: trackLayer.strokeColor!)
    }
    
    set(strokeColor) {
      trackLayer.strokeColor = strokeColor.CGColor
      pointerLayer.strokeColor = strokeColor.CGColor
    }
  }
  
  var lineWidth: CGFloat = 1.0 {
    didSet { update() }
  }
  
  let trackLayer = CAShapeLayer()
  
  var startAngle: CGFloat = 0.0 {
    didSet { update() }
  }
  
  var endAngle: CGFloat = 0.0 {
    didSet { update() }
  }
  
  let pointerLayer = CAShapeLayer()
  
  var backingPointerAngle: CGFloat = 0.0
  
  var pointerAngle: CGFloat {
    get { return backingPointerAngle }
    set { setPointerAngle(newValue, animated: false) }
  }
  
  init() {
    trackLayer.fillColor = UIColor.clearColor().CGColor
    pointerLayer.fillColor = UIColor.clearColor().CGColor
  }
  
  func setPointerAngle(pointerAngle: CGFloat, animated: Bool) {
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    
    pointerLayer.transform = CATransform3DMakeRotation(pointerAngle, 0.0, 0.0, 0.1)
    
    if animated {
      let midAngle = (max(pointerAngle, self.pointerAngle) - min(pointerAngle, self.pointerAngle) ) / 2.0 + min(pointerAngle, self.pointerAngle)
      let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
      animation.duration = 0.25
      
      animation.values = [self.pointerAngle, midAngle, pointerAngle]
      animation.keyTimes = [0.0, 0.5, 1.0]
      animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
      pointerLayer.addAnimation(animation, forKey: nil)
    }
    
    CATransaction.commit()
    
    self.backingPointerAngle = pointerAngle
  }
  
  var pointerLength: CGFloat = 0.0 {
    didSet { update() }
  }
  
  func updateTrackLayerPath() {
    let arcCenter = CGPoint(x: trackLayer.bounds.width / 2.0, y: trackLayer.bounds.height / 2.0)
    let offset = max(pointerLength, trackLayer.lineWidth / 2.0)
    let radius = min(trackLayer.bounds.height, trackLayer.bounds.width) / 2.0 - offset;
    trackLayer.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
  }
  
  func updatePointerLayerPath() {
    let path = UIBezierPath()
    path.moveToPoint(CGPoint(x: pointerLayer.bounds.width - pointerLength - pointerLayer.lineWidth / 2.0, y: pointerLayer.bounds.height / 2.0))
    path.addLineToPoint(CGPoint(x: pointerLayer.bounds.width, y: pointerLayer.bounds.height / 2.0))
    pointerLayer.path = path.CGPath
  }
  
  func update() {
    trackLayer.lineWidth = lineWidth
    pointerLayer.lineWidth = lineWidth
    
    updateTrackLayerPath()
    updatePointerLayerPath()
  }
  
  func update(bounds: CGRect) {
    let position = CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
    
    trackLayer.bounds = bounds
    trackLayer.position = position
    
    pointerLayer.bounds = bounds
    pointerLayer.position = position
    
    update()
  }
  
}
