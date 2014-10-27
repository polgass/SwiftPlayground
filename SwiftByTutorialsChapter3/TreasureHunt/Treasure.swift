//
//  Treasure.swift
//  TreasureHunt
//
//  Created by Peter Paul Sevilla on 10/26/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import MapKit

// new way to declare a protocol:
@objc protocol Alertable {
    func alert() -> UIAlertController
}

class Treasure: NSObject {
    // properties
    let what: String
    // let latitude: Double
    // let longitude: Double
    let location: GeoLocation // uses a struct
    
    // initializers
    // init(what: String, latitude: Double, longitude: Double) {
    init(what: String, location: GeoLocation) {
        self.what = what
        // self.latitude = latitude
        // self.longitude = longitude
        self.location = location
    }
    
    // CONVENIENCE INITIALIZERS
    convenience init(what: String, latitude: Double, longitude: Double) {
        let location = GeoLocation(latitude: latitude, longitude: longitude)
        self.init(what: what, location: location)
    }
    
    // FOR POLYMORPHISM
    func pinColor() -> MKPinAnnotationColor {
        return MKPinAnnotationColor.Red
    }
}

// a class extension of Treasure, allows you to add additional functionality
extension Treasure: MKAnnotation {
    // MKAnnotation protocol requires to define 'coordinate' & 'title' properties
    // computed properties
    var coordinate: CLLocationCoordinate2D {
        return self.location.coordinate
    }
    
    var title: String {
        return self.what
    }
}

// 1. You can make a class inherit from another class by declaring it. Add the superclass after a colon following the class name.
// used to not have 'final' keyword
final class HistoryTreasure: Treasure {
    let year: Int
    
    // 2. HistoryTreasure contains an extra field—the year to which the treasure relates. Therefore, you must define a designated initializer to initialize this new value. If you didn’t, then Swift could only use the superclass’s initializers, which wouldn’t initialize the year property (at least, not with a supplied value).
    init(what: String, year: Int, latitude: Double, longitude: Double) {
        self.year = year
        let location = GeoLocation(latitude: latitude, longitude: longitude)
        super.init(what: what, location: location)
    }
    
    override func pinColor() -> MKPinAnnotationColor {
        return MKPinAnnotationColor.Purple
    }
}

// 3. You then declare the FactTreasure class in much the same way. Each has its own relevant data and therefore its own designated initializer.
// used to not have 'final' keyword
final class FactTreasure: Treasure {
    let fact: String
    
    init(what: String, fact: String, latitude: Double, longitude: Double) {
        self.fact = fact
        let location = GeoLocation(latitude: latitude, longitude: longitude)
        super.init(what: what, location: location)
    }
}

// 4. You then declare the HQTreasure class in much the same way. Each has its own relevant data and therefore its own designated initializer.
// used to not have 'final' keyword
final class HQTreasure: Treasure {
    let company: String
    
    init(company: String, latitude: Double, longitude: Double) {
        self.company = company
        let location = GeoLocation(latitude: latitude, longitude: longitude)
        super.init(what: company + " headquarters", location: location)
    }
    
    override func pinColor() -> MKPinAnnotationColor {
        return MKPinAnnotationColor.Green
    }
}

// conform to Alertable protocol
extension HistoryTreasure: Alertable {
    func alert() -> UIAlertController {
        let alert = UIAlertController(
            title: "History",
            message: "From \(self.year):\n\(self.what)",
            preferredStyle: UIAlertControllerStyle.Alert)
        return alert
    }
}

extension FactTreasure: Alertable {
    func alert() -> UIAlertController {
        let alert = UIAlertController(
            title: "Fact",
            message: "From \(self.what):\n\(self.fact)",
            preferredStyle: UIAlertControllerStyle.Alert)
        return alert
    }
}

extension HQTreasure: Alertable {
    func alert() -> UIAlertController {
        let alert = UIAlertController(
            title: "Headquarters",
            message: "The headquarters of \(self.company)",
            preferredStyle: UIAlertControllerStyle.Alert)
        return alert
    }
}











































