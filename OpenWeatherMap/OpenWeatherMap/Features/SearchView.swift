//
//  SearchView.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 14/11/2021.
//

import UIKit
import SwiftUI

struct SearchView: View {
    
    var body: some View {
      NavigationView {
        List {
          searchField
//          if !viewModel.dataSource.isEmpty {
//            currentWeatherSection
//          }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("OpenWeather", displayMode: .inline)
      }
    }
    
    var searchField: some View {
      HStack(alignment: .center) {
//        TextField("Wpisz miasto", text: $viewModel.city)
      }
    }
}

