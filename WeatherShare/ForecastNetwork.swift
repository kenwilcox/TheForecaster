//
//  ForecastNetwork.swift
//  TheForecaster
//
//  Created by Kenneth Wilcox on 5/25/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit

public class ForecastNetwork: NSObject {
  
  public class func requestWeather (#latitude: Double, longitude: Double, completionClosure: (responseDictionary : NSDictionary?) -> ()) {
    
    let url = NSURL(string: "https://api.forecast.io/forecast/\(kApiKey)/\(latitude),\(longitude)")
    var request = NSMutableURLRequest(URL: url!)
    request.HTTPMethod = "GET"
    
    let session = NSURLSession.sharedSession()
    
    var weatherTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
      var conversionError: NSError?
      var jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves, error: &conversionError) as? NSDictionary
      println(jsonDictionary)
      
      if conversionError != nil {
        println(conversionError!.localizedDescription)
        completionClosure(responseDictionary: nil)
      } else {
        completionClosure(responseDictionary: jsonDictionary!)
      }
    })
    
    weatherTask.resume()
  }
}
