//
//  ViewController.swift
//  HonoluluArt
//
//  Created by Peter Paul Sevilla on 16/02/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

  @IBOutlet weak var mapView: MKMapView!
  
  let regionRadius: CLLocationDistance = 1000
  var artworks = [Artwork]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.delegate = self
    
    let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
    centerMapOnLocation(initialLocation)
    
    loadInitialData()
    mapView.addAnnotations(artworks)
    
//    // show artwork on map
//    let artwork = Artwork(title: "King David Kalakaua",
//      locationName: "Waikiki Gateway Park",
//      discipline: "Sculpture",
//      coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
//    
//    mapView.addAnnotation(artwork)
  }
  
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }
  
  func loadInitialData() {
    // 1
    let fileName = NSBundle.mainBundle().pathForResource("PublicArt", ofType: "json");
    
    var data: NSData?
    do {
      data = try NSData(contentsOfFile: fileName!, options: NSDataReadingOptions(rawValue: 0))
    } catch let error as NSError {
      print("Read error: \(error.localizedDescription)")
    }
    
    // 2
    var jsonObject: AnyObject!
    if let data = data {
      do {
        jsonObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
      } catch let error as NSError {
        print("Parse error: \(error.localizedDescription)")
      }
    }
    
    // 3
    if let jsonObject = jsonObject as? [String: AnyObject],
      // 4
      let jsonData = JSONValue.fromObject(jsonObject)?["data"]?.array {
        for artworkJSON in jsonData {
          if let artworkJSON = artworkJSON.array,
            // 5
            artwork = Artwork.fromJSON(artworkJSON) {
              artworks.append(artwork)
          }
        }
    }
  }
  
  // MARK: - location manager to authorize user location for Maps app
  var locationManager = CLLocationManager()
  func checkLocationAuthorizationStatus() {
    if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
      mapView.showsUserLocation = true
    } else {
      locationManager.requestWhenInUseAuthorization()
    }
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    checkLocationAuthorizationStatus()
  }
}

