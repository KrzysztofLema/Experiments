//
//  HomeScreenViewController.swift
//  Experiments
//
//  Created by Krzysztof Lema on 13/02/2021.
//

import Foundation
import SwiftUI
class HomeScreenViewController: UIViewController {
    override func viewDidLoad() {
        addSwiftUIView()
    }
}
private extension HomeScreenViewController {
    func addSwiftUIView() {
        let controller = UIHostingController(rootView: HomeView())
        view.addSubview(controller.view)
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.didMove(toParent: self)
        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
