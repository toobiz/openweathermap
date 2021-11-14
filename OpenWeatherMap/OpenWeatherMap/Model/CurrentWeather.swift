//
//  CurrentWeather.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 14/11/2021.
//

import Foundation

struct CurrentWeather: Codable {
  let weather: [Weather]
  let main: Main
}

struct Main: Codable {
  let temperature: Double
  let minTemperature: Double
  let maxTemperature: Double
  
  enum CodingKeys: String, CodingKey {
    case temperature = "temp"
    case minTemperature = "temp_min"
    case maxTemperature = "temp_max"
  }
}

struct Weather: Codable {
  let description: String
}
