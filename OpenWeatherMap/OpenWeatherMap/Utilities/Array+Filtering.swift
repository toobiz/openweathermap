//
//  Array+Filtering.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 16/11/2021.
//

import Foundation

public extension Array where Element: Hashable {
  static func removeDuplicates(_ elements: [Element]) -> [Element] {
    var seen = Set<Element>()
    return elements.filter{ seen.insert($0).inserted }
  }
}
