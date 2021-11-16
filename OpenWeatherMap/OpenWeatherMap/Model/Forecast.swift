//
//  Forecast.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 16/11/2021.
//

import Foundation

struct Forecast: Codable {
  let list: [List]
  
  struct List: Codable {
    let date: Date
    let main: Main
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
      case date = "dt"
      case main
      case weather
    }
  }
  
  struct Main: Codable {
    let temp: Double
    let minTemperature: Double
    let maxTemperature: Double
    
    enum CodingKeys: String, CodingKey {
      case temp
      case minTemperature = "temp_min"
      case maxTemperature = "temp_max"
    }
  }
  
  struct Weather: Codable {
    let id: Int
  }
}
