//
//  ViewController.swift
//  Experiments
//
//  Created by Krzysztof Lema on 16/01/2021.
//

import SwiftUI

class ViewController: UIViewController {
    override func viewDidLoad() {
        addSwiftUIView()
    }
}
private extension ViewController {
    func addSwiftUIView() {
        let controller = UIHostingController(rootView: FirstView())
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            controller.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

