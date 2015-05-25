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
}