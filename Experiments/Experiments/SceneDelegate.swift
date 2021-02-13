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
    let mainViewModel = MainViewModel()
    
    // swiftlint:disable line_length
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MainViewController(viewModel: mainViewModel)
        window.makeKeyAndVisible()
        self.window = window
    }
}
