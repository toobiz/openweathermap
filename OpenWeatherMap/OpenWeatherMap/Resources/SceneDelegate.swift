//
//  SceneDelegate.swift
//  OpenWeatherMap
//
//  Created by Michał Tubis on 14/11/2021.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }

        let networkConnector = NetworkConnector()
        let apiRepository = ApiRepository(networkConnector: networkConnector)
        let viewModel = SearchViewModel(apiRepository: apiRepository)
        let view = SearchView(viewModel: viewModel)

        // Use a UIHostingController as window root view controller
        let window = UIWindow(windowScene: scene)
        window.rootViewController = UIHostingController(rootView: view)
        window.makeKeyAndVisible()
        self.window = window
    }
}

