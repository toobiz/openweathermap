//
//  DateFormatter.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 16/11/2021.
//

import Foundation

let dayFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "EEEE"
  let prefferredLanguage = Locale.preferredLanguages[0]
  formatter.locale = Locale(identifier: prefferredLanguage)
  return formatter
}()
