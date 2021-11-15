//
//  CurrentWeatherView.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 15/11/2021.
//

import SwiftUI

struct CurrentWeatherView: View {
  @ObservedObject var viewModel: CurrentWeatherViewModel

  init(viewModel: CurrentWeatherViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    HStack {
      Text("\(viewModel.city)")
        .font(.system(size: 24))
    }
    Spacer()
    contentView
  }
  
  func content() -> some View {
    guard viewModel.datasource != nil else { return AnyView(self) }
    return AnyView(contentView)
  }
  
  var contentView: some View {
    VStack(alignment: .center) {
      HStack {
        Text("\(viewModel.temperature)°")
          .font(.system(size: 100))
      }
      HStack {
        Text("\(viewModel.description)")
      }
      HStack {
        Text("Od")
        Text("\(viewModel.minTemperature)°")
        Text("do")
        Text("\(viewModel.maxTemperature)°")
      }
      Spacer()
    }
    .foregroundColor(.gray)
  }
}
