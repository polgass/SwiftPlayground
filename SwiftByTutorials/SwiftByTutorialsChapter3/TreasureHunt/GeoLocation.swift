//
//  GeoLocation.swift
//  TreasureHunt
//
//  Created by Peter Paul Sevilla on 10/26/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import MapKit

struct GeoLocation {
    var latitude: Double
    var longitude: Double
    
    func distanceBetween(other: GeoLocation) -> Double {
        let locationA = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let locationB = CLLocation(latitude: other.latitude, longitude: other.longitude)
        return locationA.distanceFromLocation(locationB)
    }
}

extension GeoLocation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(self.latitude, self.longitude)
    }
    
    var mapPoint: MKMapPoint {
        return MKMapPointForCoordinate(self.coordinate)
    }
}

extension GeoLocation: Equatable {
}

// must declare all operator overloads at global scope because they aren’t methods that belong to a class – you can use the == operator on its own anywhere. They are only associated with a class in that the type of the two parameters are instances of the class the function is comparing.
func ==(lhs: GeoLocation, rhs: GeoLocation) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}
