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

        let searchView = SearchView()

        let window = UIWindow(windowScene: scene)
        window.rootViewController = UIHostingController(rootView: searchView)
        window.makeKeyAndVisible()
        self.window = window
    }
}

