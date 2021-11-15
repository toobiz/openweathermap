//
//  CurrentWeatherViewModel.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 15/11/2021.
//

import SwiftUI
import Combine

class CurrentWeatherViewModel: ObservableObject, Identifiable {
  
  @Published var datasource: CurrentWeather?

  private var disposables = Set<AnyCancellable>()
  
  var description: String {
    guard let description = datasource?.weather.first?.description else { return String() }
    return description
  }
    
  var city: String {
    guard let datasource = datasource else { return String() }
      return datasource.name
  }
  
  var temperature: String {
    guard let datasource = datasource else { return String() }
    return String(format: "%.0f", datasource.main.temperature)
  }
  
  var minTemperature: String {
    guard let datasource = datasource else { return String() }
    return String(format: "%.0f", datasource.main.minTemperature)
  }

  var maxTemperature: String {
    guard let datasource = datasource else { return String() }
    return String(format: "%.0f", datasource.main.maxTemperature)
  }

  init(datasource: CurrentWeather?) {
    self.datasource = datasource
  }
}
