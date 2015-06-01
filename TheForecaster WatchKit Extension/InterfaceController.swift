//
//  InterfaceController.swift
//  TheForecaster WatchKit Extension
//
//  Created by Kenneth Wilcox on 5/31/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import WatchKit
import Foundation
import WeatherShare

class InterfaceController: WKInterfaceController {
  
  @IBOutlet weak var temperatureLabel: WKInterfaceLabel!
  @IBOutlet weak var weatherIconImage: WKInterfaceImage!
  @IBOutlet weak var conditionsLabel: WKInterfaceLabel!
  @IBOutlet weak var locationLabel: WKInterfaceLabel!
  @IBOutlet weak var map: WKInterfaceMap!
  @IBOutlet weak var lastUpdatedLabel: WKInterfaceLabel!
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    // Configure interface objects here.
    self.updateUI()
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  @IBAction func hourlyWeatherButtonPressed() {
    
  }
  
  @IBAction func refreshButtonPressed() {
    
  }
  
  func updateUI () {
    var userDefaults = NSUserDefaults(suiteName: GlobalConstants.NSUserDefaults.suiteName)
    println(userDefaults?.objectForKey(GlobalConstants.NSUserDefaults.locationInfo))
    
    let locationData: AnyObject? = userDefaults?.objectForKey(GlobalConstants.NSUserDefaults.locationInfo)
    if locationData != nil {
      let locationDictionary = locationData as! Dictionary<String, AnyObject>
      let latitude = locationDictionary[GlobalConstants.LocationDictionary.latitude] as! Double
      let longitude = locationDictionary[GlobalConstants.LocationDictionary.longitude] as! Double
      let city = locationDictionary[GlobalConstants.LocationDictionary.city] as! String
      let state = locationDictionary[GlobalConstants.LocationDictionary.state] as! String
      let country = locationDictionary[GlobalConstants.LocationDictionary.country] as! String
      let lastUpdatedAt = locationDictionary[GlobalConstants.LocationDictionary.timestamp] as! NSDate
    } else {
      println("Location for NSUserDefaults is empty")
    }
    
    
  }
}
