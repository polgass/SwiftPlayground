//
//  ViewController.swift
//  FaceDetection
//
//  Created by Paul Sevilla on 9/22/15.
//  Copyright (c) 2015 Paul Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    faceDetector()
  }

  
  func faceDetector() {
    let image = UIImage(named: "image3")
    imageView.image = image
    
    markFaces(imageView)
    
    imageView.transform = CGAffineTransformMakeScale(1, -1)
    view.transform = CGAffineTransformMakeScale(1, -1)
  }
  

  func markFaces(facePicture: UIImageView) {
    let image = CIImage(CGImage: facePicture.image?.CGImage)
    let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
    let features = detector.featuresInImage(image)
    
    UIGraphicsBeginImageContext(imageView.image!.size)
    imageView.image!.drawInRect(CGRectMake(0,0,imageView.image!.size.width,imageView.image!.size.height))
    
    for faceFeature in features {
      
      //context
      var drawCtxt = UIGraphicsGetCurrentContext()
      
      var faceRect = (faceFeature as! CIFaceFeature).bounds
      faceRect.origin.y = imageView.image!.size.height - faceRect.origin.y - faceRect.size.height
      CGContextSetStrokeColorWithColor(drawCtxt, UIColor.redColor().CGColor)
      CGContextStrokeRect(drawCtxt,faceRect)
      
      /*
      let faceWidth = faceFeature.bounds.size.width
      let faceView = UIView(frame: faceFeature.bounds)
      faceView.layer.borderWidth = 1
      faceView.layer.borderColor = UIColor.redColor().CGColor
      
      imageView.addSubview(faceView)
      
      if let leftEyeExists = faceFeature.hasLeftEyePosition where leftEyeExists {
        let leftEyeView = UIView(frame: CGRect(x: faceFeature.leftEyePosition.x - faceWidth * 0.15, y: faceFeature.leftEyePosition.y - faceWidth * 0.15, width: faceWidth * 0.3, height: faceWidth * 0.3))
        leftEyeView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.3)
        leftEyeView.center = faceFeature.leftEyePosition
        leftEyeView.layer.cornerRadius = faceWidth * 0.15
        view.addSubview(leftEyeView)
      }
      
      if let rightEyeExists = faceFeature.hasLeftEyePosition where rightEyeExists {
        let rightEyeView = UIView(frame: CGRect(x: faceFeature.rightEyePosition.x - faceWidth * 0.15, y: faceFeature.rightEyePosition.y - faceWidth * 0.15, width: faceWidth * 0.3, height: faceWidth * 0.3))
        rightEyeView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.3)
        rightEyeView.center = faceFeature.rightEyePosition
        rightEyeView.layer.cornerRadius = faceWidth * 0.15
        view.addSubview(rightEyeView)
      }
      
      if let mouthExists = faceFeature.hasMouthPosition where mouthExists {
        let mouth = UIView(frame: CGRect(x: faceFeature.mouthPosition.x - faceWidth * 0.2, y: faceFeature.mouthPosition.y - faceWidth * 0.2, width: faceWidth * 0.4, height: faceWidth * 0.4))
        mouth.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.3)
        mouth.center = faceFeature.mouthPosition
        mouth.layer.cornerRadius = faceWidth * 0.2
        view.addSubview(mouth)
      }
      */
    }
    
    var drawedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    imageView.image = drawedImage
  }
  
}

