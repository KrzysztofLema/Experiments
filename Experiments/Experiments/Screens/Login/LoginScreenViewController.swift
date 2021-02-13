//
//  LoginScreen.swift
//  Experiments
//
//  Created by Krzysztof Lema on 27/01/2021.
//

import SwiftUI

class LoginScreenViewController: UIViewController{
    
    let loginViewModel: LoginViewModel
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        addSwiftUIView()
    }
}
private extension LoginScreenViewController {
    func addSwiftUIView() {
        let controller = UIHostingController(rootView: LoginScreenView(viewModel: loginViewModel))
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
