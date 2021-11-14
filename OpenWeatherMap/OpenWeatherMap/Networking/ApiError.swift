//
//  ApiError.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 14/11/2021.
//

import Foundation

enum ApiError: Error {
  case parsing(description: String)
  case network(description: String)
}
