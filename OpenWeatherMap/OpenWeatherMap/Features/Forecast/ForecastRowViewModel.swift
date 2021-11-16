//
//  ForecastRowViewModel.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 16/11/2021.
//

import Foundation
import SwiftUI

struct ForecastRowViewModel: Identifiable {
  private let dataSource: Forecast.List
  
  var id: String {
    day + String(describing: dataSource.weather.first?.id)
  }
  
  var day: String {
    dayFormatter.string(from: dataSource.date)
  }
    
  var minTemperature: String {
    String(format: "%.0f", dataSource.main.minTemperature)
  }
  
  var maxTemperature: String {
    String(format: "%.0f", dataSource.main.maxTemperature)
  }
  
  init(dataSource: Forecast.List) {
    self.dataSource = dataSource
  }
}

extension ForecastRowViewModel: Hashable {
  static func == (lhs: ForecastRowViewModel, rhs: ForecastRowViewModel) -> Bool {
    return lhs.day == rhs.day
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.day)
  }
}

