//
//  ViewController.swift
//  TheForecaster
//
//  Created by Kenneth Wilcox on 5/12/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var weatherImageView: UIImageView!
  @IBOutlet weak var weatherConditionsLabel: UILabel!
  @IBOutlet weak var updateDateLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "locationDidUpdate:", name: LocationController.locationDidUpdate, object: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func locationDidUpdate(notification: NSNotification) {
    println("locationAvaliable")
  }
  
  @IBAction func refreshWeatherButtonPressed(sender: UIButton) {
  }
  
}

