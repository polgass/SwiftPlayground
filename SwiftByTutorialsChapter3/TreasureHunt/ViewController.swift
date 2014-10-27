/*
* Copyright (c) 2014 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import MapKit

class ViewController: UIViewController {
  
    @IBOutlet var mapView : MKMapView!
    
    private var treasures: [Treasure] = []
    private var foundLocations: [GeoLocation] = []
    private var polyline: MKPolyline!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.treasures = [
            HistoryTreasure(what: "Google's first office", year: 1999, latitude: 37.44451, longitude: -122.163369),
            HistoryTreasure(what: "Facebook's first office", year: 2005, latitude: 37.444268, longitude: -122.163271),
            FactTreasure(what: "Stanford University", fact: "Founded in 1885 by Leland Stanford.", latitude: 37.427474, longitude: -122.169719),
            FactTreasure(what: "Moscone West", fact: "Host to WWDC since 2003.", latitude: 37.783083, longitude: -122.404025),
            FactTreasure(what: "Computer History Museum", fact: "Home to a working Babbage Difference Engine.", latitude: 37.414371, longitude: -122.076817),
            HQTreasure(company: "Apple", latitude: 37.331741, longitude: -122.030333),
            HQTreasure(company: "Facebook", latitude: 37.485955, longitude: -122.148555),
            HQTreasure(company: "Google", latitude: 37.422, longitude: -122.084),
        ]
        
        // assign self as MKMapView delegate
        self.mapView.delegate = self
        self.mapView.addAnnotations(self.treasures)
        
        // change map's view to where the annotations are
        // 1. This algorithm works by using the reduce function of an array. To reduce an array means to run a function over the array that combines each element into a single, final return value. At each step, the next element from the array is passed along with the current value for the reduce. The return value from the function then becomes the current value for the next reduce. Of course, you need to seed the reduce with an initial value. In this case, your seed is MKMapRectNull.
        let rectToDisplay = self.treasures.reduce(MKMapRectNull) {
            (mapRect: MKMapRect, treasure: Treasure) -> MKMapRect in
            // 2. At each step in the reduce, you calculate a map rectangle enclosing just the single treasure.
            let treasurePointRect = MKMapRect(origin: treasure.location.mapPoint, size: MKMapSize(width: 0, height: 0))
            // 3. You then return a rectangle made up of the union of the current overall rectangle and the single treasure rectangle.
            return MKMapRectUnion(mapRect, treasurePointRect)
        }
        
        // 4. When the reduce finishes, the map rectangle will be the union of all the map rectangles enclosing each and every treasure point. In other words, it will be a rectangle just large enough to enclose every treasure!
        self.mapView.setVisibleMapRect(rectToDisplay, edgePadding: UIEdgeInsetsMake(74, 10, 10, 10), animated: false)
    }
    
    private func markTreasureAsFound(treasure: Treasure) {
        // 1
        if let index = find(self.foundLocations, treasure.location) {
            // 2
            let alert = UIAlertController(title: "Oops!", message: "You've already found this treasure (at step \(index + 1))! Try again!",  preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else { // 3
            self.foundLocations.append(treasure.location)
            // 4
            if self.polyline != nil {
                self.mapView.removeOverlay(self.polyline)
            }
            // 5
            var coordinates = self.foundLocations.map { $0.coordinate }
            self.polyline = MKPolyline(coordinates: &coordinates, count: coordinates.count)
            self.mapView.addOverlay(self.polyline)
        }
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        // 1. It implements mapView:viewForAnnotation. Notice in the method signature that the annotation you pass in is of type MKAnnotation!. This means it’s an optional, so the value could be nil. But it’s an implicitly unwrapped optional, meaning you can use it without checking for nil. But if you don’t check for nil and it happens to be nil, then your app will crash at runtime. Many Objective-C APIs are wrappedlike this because there are no optionals in Objective-C. Because the annotation could be nil or even something other than a Treasure instance, you need to cast it to a Treasure. You do this using the inline downcasting syntax. You perform the downcast using as? and immediately assign it to the local variable treasure. Only if the downcast succeeds will the if statement pass.
        if let treasure = annotation as? Treasure { // 'as?' is an inline downcasting syntax
            // 2. If the annotation is a treasure, then dequeue a view from the map for the reuse identifier pin. This simply means that if the program has created a pin before, but it’s no longer onscreen because the user has moved the map away, then the program will reuse the view rather than create a new one. If you’re familiar with UITableViews, you’ve probably used the same concept when you dequeue and reuse a UITableViewCell. Notice the use of downcast again, this time in the non- optional form as, because you know that all “pin” annotation views will be MKPinAnnotationView instances.
            var view = mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as MKPinAnnotationView!
            if view == nil {
                // 3. If no view could be dequeued, then create a new one and set it up as appropriate.
                // maybe use 'treasure' constant instead of 'annotation'?, i.e:
                // view = MKPinAnnotationView(annotation: treasure, reuseIdentifier: "pin")
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
                view.canShowCallout = true
                view.animatesDrop = false
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as UIView
            } else {
                // 4. If a view was dequeued, then change its annotation.
                // maybe use 'treasure' constant instead of 'annotation'?, i.e:
                // view.annotation = treasure
                view.annotation = annotation
            }
            // 5. Finally, return the annotation view.
            view.pinColor = treasure.pinColor()
            return view
        }
        return nil
    }
                
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        if let treasure = view.annotation as? Treasure {
            if let alertable = treasure as? Alertable {
                let alert = alertable.alert()
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                alert.addAction(UIAlertAction(title: "Found", style: UIAlertActionStyle.Default) { action in
                    self.markTreasureAsFound(treasure)
                })
                alert.addAction(UIAlertAction(title: "Find Nearest", style: UIAlertActionStyle.Default) { action in
                    // 1. You’re going to sort the list of treasures, so you create a local variable to hold a copy of the original array. The sort method takes a single parameter — a closure that takes two objects—and returns a Boolean indicating whether object one is ordered before object two.
                    var sortedTreasures = self.treasures
                    sortedTreasures.sort {
                        // 2. Next, you calculate the distance between the current treasure and each of the treasures you’re sorting. Notice the use of $0 and $1. This is shorthand syntax for the first and second parameters passed into a closure. There will be more on this in the chapter on closures!
                        // You check the first distance against the second distance and return true if it’s smaller. In this way, you sort the array of treasures in order of shortest to longest distance from the current treasure.
                        let distanceA = treasure.location.distanceBetween($0.location)
                        let distanceB = treasure.location.distanceBetween($1.location)
                        return distanceA < distanceB
                    }
                    // 3. Finally, you deselect the current treasure and select the new treasure. If you’re wondering why the code selects the second element in the sorted array, it’s because the first element will always be the current treasure itself!
                    mapView.deselectAnnotation(treasure, animated: true)
                    mapView.selectAnnotation(sortedTreasures[1], animated: true)
                })
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if let polylineOverlay = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polylineOverlay)
            renderer.strokeColor = UIColor.blueColor()
            return renderer
        }
        return nil
    }
}
