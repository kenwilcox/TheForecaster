//
//  HourlyWeatherInterfaceController.swift
//  TheForecaster
//
//  Created by Kenneth Wilcox on 6/1/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import WatchKit
import Foundation
import WeatherShare

class HourlyWeatherInterfaceController: WKInterfaceController {
  
  @IBOutlet weak var timeLabel: WKInterfaceLabel!
  @IBOutlet weak var temperatureLabel: WKInterfaceLabel!
  @IBOutlet weak var weatherIconImage: WKInterfaceImage!
  @IBOutlet weak var chanceOfRainLabel: WKInterfaceLabel!
  @IBOutlet weak var summaryLabel: WKInterfaceLabel!
  @IBOutlet weak var nextButton: WKInterfaceButton!
  @IBOutlet weak var previousButton: WKInterfaceButton!
  
  var currentIndex: Int!
  var hourlyWeatherArray: [AnyObject]!
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    // Configure interface objects here.
    self.currentIndex = 0
    self.hourlyWeatherArray = context as! [AnyObject]
    updateUI()
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  @IBAction func previousButtonPressed() {
    if self.currentIndex != 0 {
      self.currentIndex!--
    }
    updateUI()
  }
  
  @IBAction func nextButtonPressed() {
    if self.currentIndex < self.hourlyWeatherArray.count - 1 {
      self.currentIndex!++
    }
    updateUI()
  }
  
  func updateUI() {
    let hourlyWeatherDictionary = self.hourlyWeatherArray[currentIndex] as! NSDictionary
    
    let time = hourlyWeatherDictionary[GlobalConstants.ForecastNetwork.time] as! Double
    let hourlyDate = NSDate(timeIntervalSince1970: time)
    let formattedDate = NSDateFormatter.localizedStringFromDate(hourlyDate, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
    self.timeLabel.setText(formattedDate)
    
    let temperature = hourlyWeatherDictionary[GlobalConstants.ForecastNetwork.temperature] as! Double
    self.temperatureLabel.setText("\(temperature) ℉")
    
    let iconString = hourlyWeatherDictionary[GlobalConstants.ForecastNetwork.icon] as! String
    println("\(iconString)")
    var image = UIImage(named: iconString)
    if image == nil {
      image = UIImage(named: "nodata")
    }
    self.weatherIconImage.setImage(image)
    
    let perceipProbability = hourlyWeatherDictionary[GlobalConstants.ForecastNetwork.precipProbability] as! Double
    self.chanceOfRainLabel.setText("\(perceipProbability * 100)%")
    
    let summaryString = hourlyWeatherDictionary[GlobalConstants.ForecastNetwork.summary] as! String
    self.summaryLabel.setText(summaryString)
    
    previousButton.setEnabled(self.currentIndex! != 0)
    nextButton.setEnabled(self.currentIndex! < self.hourlyWeatherArray.count - 1)
  }
}
