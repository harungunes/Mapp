//
//  Date+Ext.swift
//  Trackio
//
//  Created by Harun Gunes on 27/06/2022.
//

import Foundation

extension Date {
  
  static var trackioDateFormatter: DateFormatter {
      let formatter = DateFormatter()
      formatter.timeZone = TimeZone(abbreviation: "MDT")
      return formatter
    }
  
  var monthDayYearString: String {
    let dateFormatter = Date.trackioDateFormatter
    dateFormatter.dateFormat = "MMM d, YYYY"
    return dateFormatter.string(from: self)
  }
}
