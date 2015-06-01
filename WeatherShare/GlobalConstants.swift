//
//  GlobalConstants.swift
//  TheForecaster
//
//  Created by Kenneth Wilcox on 5/25/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation

public struct GlobalConstants {
  
  public struct NotificationNames {
    public static let locationDidUpdate = "LOCATION_DID_UPDATE"
  }
  
  public struct LocationDictionary {
    public static let latitude = "latitude"
    public static let longitude = "longitude"
    public static let city = "city"
    public static let state = "state"
    public static let country = "country"
    public static let timestamp = "lastUpdatedAt"
  }
  
  public struct ForecastNetwork {
    public static let currently = "currently"
    public static let icon = "icon"
    public static let temperature = "temperature"
    public static let summary = "summary"
  }
  
  public struct NSUserDefaults {
    public static let suiteName = "group.TheForecaster.k3nx.com"
    public static let locationInfo = "LOCATION_INFO"
  }
}