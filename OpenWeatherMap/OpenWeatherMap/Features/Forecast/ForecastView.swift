//
//  ForecastView.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 16/11/2021.
//

import SwiftUI

struct ForecastView: View {
  @ObservedObject var viewModel: ForecastViewModel

  init(viewModel: ForecastViewModel) {
    self.viewModel = viewModel
    viewModel.fetchForecast()
  }

  var body: some View {
    List {
      Section {
        ForEach(viewModel.dataSource, content: ForecastRow.init(viewModel:))
      }
    }
    .listStyle(GroupedListStyle())
    .navigationBarTitle(viewModel.city, displayMode: .inline)
  }
}
