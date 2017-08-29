//  ViewController.swift
//  Map
//
//  Created by Andrew Ton on 2/27/16.
//  Copyright © 2016 Andrew Ton. All rights reserved.
// @https://www.pubnub.com/blog/2015-05-05-getting-started-ios-location-tracking-and-streaming-w-swift-programming-language/

import UIKit
import MapKit
import CoreLocation
import Foundation

class Map: UIViewController , CLLocationManagerDelegate {

    @IBOutlet var Map: MKMapView!
    @IBOutlet var LocationButton: UIButton!
    @IBOutlet var ZoomOutButton: UIButton!
    
    private var locationManager = CLLocationManager()
    private var userLongitude = 0.0; //default values
    private var userLatitude = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        self.locationManager.delegate = self //location manager is a delegate for view controller. this means we must overrride some methods with a class YourViewController
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest //accuracy. balance between energy/accuracy
        self.locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
        var location = CLLocationCoordinate2DMake(37.229702, -80.419925) //location - of a hypothetical event
        
        var annotation = MKPointAnnotation() //pin
        annotation.coordinate = location //pin location
        annotation.title = "My Event" //pin title
        annotation.subtitle = "subtitle, event details" //pin details
        
        Map.addAnnotation(annotation)
    }
    
    
    @IBAction func LocationClick(sender: AnyObject) {
        LocationButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        ZoomOutButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        var location = CLLocationCoordinate2DMake(userLatitude, userLongitude) //make this a global variable?
        var span = MKCoordinateSpanMake(0.005, 0.005)
        var region = MKCoordinateRegion(center: location, span: span)
        Map.setRegion(region, animated: true)
        
    }
    
    @IBAction func ZoomButtonClick(sender: AnyObject) {
        LocationButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        ZoomOutButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        var location = CLLocationCoordinate2DMake(userLatitude, userLongitude) //make this a global variable?
        var span = MKCoordinateSpanMake(1, 1)
        var region = MKCoordinateRegion(center: location, span: span)
        Map.setRegion(region, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //handles errors w/ locationManager
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("didFailWithError: \(error.description)")
        let errorAlert = UIAlertView(title: "Error", message: "Failed to Get Your Location", delegate: nil, cancelButtonTitle: "Ok")
        errorAlert.show()
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [CLLocation]!) {
        let newLocation = locations.last! as CLLocation
        userLatitude = newLocation.coordinate.latitude
        userLongitude = newLocation.coordinate.longitude
        print("current position: \(newLocation.coordinate.longitude) , \(newLocation.coordinate.latitude)")
    }
    
}

