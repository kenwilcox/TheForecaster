//
//  LocationController.swift
//  TheForecaster
//
//  Created by Kenneth Wilcox on 5/12/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit
import CoreLocation
import WeatherShare

class LocationController: NSObject {
  
  var locationManager:CLLocationManager!
  //class var locationDidUpdate: String { return "LOCATION_DID_UPDATE" }
  
  override init() {
    
    super.init()
    
    self.locationManager = CLLocationManager()
    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.requestAlwaysAuthorization()
    self.locationManager.distanceFilter = 100.0
    self.locationManager.startUpdatingLocation()
  }
  
}

// MARK: - CLLocationManagerDelegate
extension LocationController: CLLocationManagerDelegate {
  
  func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    
    let location = locations.last as! CLLocation
    println("didUpdateLocations: \(location)")
    
    let geocoder = CLGeocoder()
    geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
      if error != nil {
        println("Error reverse geocoding: \(error)")
      } else {
        let placemark = placemarks.last as! CLPlacemark
        
        let locationInfo = [
          GlobalConstants.LocationDictionary.latitude: placemark.location.coordinate.latitude,
          GlobalConstants.LocationDictionary.longitude: placemark.location.coordinate.longitude,
          GlobalConstants.LocationDictionary.city: placemark.locality,
          GlobalConstants.LocationDictionary.state: placemark.administrativeArea,
          GlobalConstants.LocationDictionary.country: placemark.country,
          GlobalConstants.LocationDictionary.timestamp: location.timestamp
          ] as NSDictionary
        
        NSNotificationCenter.defaultCenter().postNotificationName(GlobalConstants.NotificationNames.locationDidUpdate, object: nil, userInfo: locationInfo as [NSObject : AnyObject])
        
      }
    })

  }
}
