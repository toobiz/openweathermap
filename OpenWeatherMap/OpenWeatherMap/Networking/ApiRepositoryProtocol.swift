//
//  ApiRepositoryProtocol.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 14/11/2021.
//

import Foundation
import Combine

protocol ApiRepositoryProtocol {
  func fetchCurrentWeather(forCity city: String) -> AnyPublisher<CurrentWeather, ApiError>
  func fetchForecast(forCity city: String) -> AnyPublisher<Forecast, ApiError>
}

class ApiRepository: ApiRepositoryProtocol {
  private let networkConnector = NetworkConnector()
  
  private let apiKey = "cbaad4e703689328bb4891bcfa6363b1"
  private let weatherEndpoint = "/weather"
  private let forecastEndpoint = "/forecast"
    
  func fetchCurrentWeather(forCity city: String) -> AnyPublisher<CurrentWeather, ApiError> {
    return networkConnector.performTask(with: URLComponentsFor(city: city, endpoint: weatherEndpoint))
  }
  
  func fetchForecast(forCity city: String) -> AnyPublisher<Forecast, ApiError> {
    return networkConnector.performTask(with: URLComponentsFor(city: city, endpoint: forecastEndpoint))
  }
    
  private func URLComponentsFor(city: String, endpoint: String) -> URLComponents {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.openweathermap.org"
    components.path = "/data/2.5" + endpoint
    
    components.queryItems = [
      URLQueryItem(name: "q", value: city),
      URLQueryItem(name: "mode", value: "json"),
      URLQueryItem(name: "units", value: "metric"),
      URLQueryItem(name: "lang", value: "pl"),
      URLQueryItem(name: "appId", value: apiKey)
    ]
    
    return components
  }
}
