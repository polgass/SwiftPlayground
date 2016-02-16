//
//  ParkMapOverlay.swift
//  Park View
//
//  Created by Peter Paul Sevilla on 16/02/2016.
//  Copyright © 2016 Chris Wagner. All rights reserved.
//

import Foundation
import MapKit

class ParkMapOverlay: NSObject, MKOverlay {
  var coordinate: CLLocationCoordinate2D
  var boundingMapRect: MKMapRect
  
  init(park: Park) {
    boundingMapRect = park.overlayBoundingMapRect
    coordinate = park.midCoordinate
  }
}
