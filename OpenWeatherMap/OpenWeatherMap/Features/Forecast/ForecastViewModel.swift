//
//  ForecastViewModel.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 16/11/2021.
//

import SwiftUI
import Combine

class ForecastViewModel: ObservableObject, Identifiable {
  
  @Published var city: String
  @Published var dataSource: [ForecastRowViewModel] = []

  private let apiRepository = ApiRepository()
  private var disposables = Set<AnyCancellable>()
  
  init(city: String) {
    self.city = city
  }
  
  func fetchForecast() {
    apiRepository.fetchForecast(forCity: city)
      .map { $0.list.map(ForecastRowViewModel.init) }
      .map(Array.removeDuplicates)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] value in
        guard let self = self else { return }
        switch value {
        case .failure:
          self.dataSource = []
        case .finished:
          break
        }},
            receiveValue: { [weak self] value in
        guard let self = self else { return }
        self.dataSource = value })
      .store(in: &disposables)
  }
}
