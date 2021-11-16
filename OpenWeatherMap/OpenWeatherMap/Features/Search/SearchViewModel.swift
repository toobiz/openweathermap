//
//  SearchViewModel.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 14/11/2021.
//

import SwiftUI
import Combine

class SearchViewModel: ObservableObject, Identifiable {
  
  @Published var city: String = ""
  @Published var dataSource: CurrentWeather?

  private let apiRepository = ApiRepository()
  private var disposables = Set<AnyCancellable>()

  init(scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel")) {
    
    $city
      .dropFirst(1)
      .debounce(for: .seconds(0.5), scheduler: scheduler)
      .sink(receiveValue: fetchWeather(forCity:))
      .store(in: &disposables)
  }
  
  func fetchWeather(forCity city: String) {
      apiRepository.fetchCurrentWeather(forCity: city)
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure:
              self.dataSource = nil
          case .finished:
            break
          }}, receiveValue: { [weak self] value in
            guard let self = self else { return }
              self.dataSource = value
        })
        .store(in: &disposables)
  }
}

extension SearchViewModel {
  var currentWeatherView: some View {
    let viewModel = CurrentWeatherViewModel(datasource: dataSource)
    return CurrentWeatherView(viewModel: viewModel)
  }
  
  var forecastView: some View {
    let viewModel = ForecastViewModel(city: city)
    return ForecastView(viewModel: viewModel)
  }
}
