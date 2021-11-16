//
//  ForecastRow.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 16/11/2021.
//

import SwiftUI

struct ForecastRow: View {
  private let viewModel: ForecastRowViewModel
  
  init(viewModel: ForecastRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    HStack {
      VStack {
        Text("\(viewModel.day)")
      }
      Spacer()
      Text("Od \(viewModel.minTemperature)° do \(viewModel.maxTemperature)°")
    }
  }
}
