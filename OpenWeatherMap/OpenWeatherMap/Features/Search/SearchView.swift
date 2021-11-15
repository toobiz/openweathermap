//
//  SearchView.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 14/11/2021.
//

import UIKit
import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    init(viewModel: SearchViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
      NavigationView {
        List {
          searchField
          if viewModel.dataSource != nil {
            currentWeatherSection
          }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("OpenWeatherMap", displayMode: .inline)
      }
    }
    
    var searchField: some View {
      HStack(alignment: .center) {
        TextField("Wpisz miasto", text: $viewModel.city)
      }
    }
    
    var currentWeatherSection: some View {
      Section {
        NavigationLink(destination: currentWeatherView) {
          VStack(alignment: .leading) {
            Text(viewModel.city)
            Text("Aktualna pogoda")
              .font(.caption)
              .foregroundColor(.gray)
          }
        }
//        NavigationLink(destination: forecast) {
          VStack(alignment: .leading) {
            Text(viewModel.city)
            Text("Prognoza pogody")
              .font(.caption)
              .foregroundColor(.gray)
          }
//        }
      }
    }
}

extension SearchView {
    var currentWeatherView: some View {
        let viewModel = CurrentWeatherViewModel(datasource: viewModel.dataSource)
        return CurrentWeatherView(viewModel: viewModel)
    }
}

