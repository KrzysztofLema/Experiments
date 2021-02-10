//
//  SceneDelegate.swift
//  Experiments
//
//  Created by Krzysztof Lema on 16/01/2021.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = LoginScreenViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}

