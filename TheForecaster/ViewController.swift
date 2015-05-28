//
//  ViewController.swift
//  TheForecaster
//
//  Created by Kenneth Wilcox on 5/12/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit
import WeatherShare

class ViewController: UIViewController {
  
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var weatherImageView: UIImageView!
  @IBOutlet weak var weatherConditionsLabel: UILabel!
  @IBOutlet weak var updateDateLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "locationDidUpdate:", name: GlobalConstants.NotificationNames.locationDidUpdate, object: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func refreshWeatherButtonPressed(sender: UIButton) {
  }
  
  func locationDidUpdate(notification: NSNotification) {
    println("locationAvaliable")
    
    let locationDictionary = notification.userInfo as! Dictionary<String,AnyObject>
    let latitude = locationDictionary[GlobalConstants.LocationDictionary.latitude] as! Double
    let longitude = locationDictionary[GlobalConstants.LocationDictionary.longitude] as! Double
    let city = locationDictionary[GlobalConstants.LocationDictionary.city] as! String
    let state = locationDictionary[GlobalConstants.LocationDictionary.state] as! String
    let country = locationDictionary[GlobalConstants.LocationDictionary.country] as! String
    let lastUpdatedAt = locationDictionary[GlobalConstants.LocationDictionary.timestamp] as! NSDate
    println(locationDictionary)
    
    locationLabel.text = "\(city), \(state) (\(country))"
    
    ForecastNetwork.requestWeather(latitude: latitude, longitude: longitude) { (responseDictionary) -> () in
      println(responseDictionary)
      
      if responseDictionary != nil {
        let currentConditionsDictionary = responseDictionary!["currently"] as! NSDictionary
        let iconName = currentConditionsDictionary["icon"] as! String
        self.weatherImageView.image = UIImage(named: iconName)
      } else {
        println("No Response: could not update")
      }
    }
  }

}

