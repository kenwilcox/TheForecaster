//
//  InterfaceController.swift
//  TheForecaster WatchKit Extension
//
//  Created by Kenneth Wilcox on 5/31/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import WatchKit
import Foundation


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
  
}
