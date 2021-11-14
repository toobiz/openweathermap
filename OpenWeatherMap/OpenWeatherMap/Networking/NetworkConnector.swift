//
//  NetworkConnector.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 14/11/2021.
//

import Foundation
import Combine

class NetworkConnector {
  
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func performTask<T>(with components: URLComponents) -> AnyPublisher<T, ApiError> where T: Decodable {
    guard let url = components.url else {
      let error = ApiError.network(description: "Couldn't create URL")
      return Fail(error: error).eraseToAnyPublisher()
    }

    return session.dataTaskPublisher(for: URLRequest(url: url))
      .mapError { error in
        .network(description: error.localizedDescription) }
      .flatMap(maxPublishers: .max(1)) { pair in
        decode(pair.data) }
      .eraseToAnyPublisher()
  }
}
