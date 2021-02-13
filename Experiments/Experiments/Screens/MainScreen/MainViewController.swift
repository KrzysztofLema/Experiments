//
//  MainViewController.swift
//  Experiments
//
//  Created by Krzysztof Lema on 10/02/2021.
//

import Foundation
import UIKit
import Combine

enum ViewToPresent {
    case splashScreen
    case loginScreen
    case homeScreen
}

class MainViewController: UIViewController {
    
    let viewModel: MainViewModel
    lazy var loginViewController = LoginScreenViewController(loginViewModel: LoginViewModel(loginRepository: LoginRepositoryImpl(), loginResponder: viewModel))
    let splashScreenViewController = SplashViewController()
    let homeScreenViewController = HomeScreenViewController()
    
    var subscriptions = Set<AnyCancellable>()
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func present(_ view: ViewToPresent) {
        switch view {
        case .loginScreen:
            presentLoginScreen()
        case .splashScreen:
            presentSplashScreen()
        case .homeScreen:
            presentHomeScreen()
        }
    }
    
    override func viewDidLoad() {
        bind()
    }
    
    func subscribe(to publisher: AnyPublisher<ViewToPresent, Never>) {
        publisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] view in
                guard let self = self else { return }
                self.present(view)
            }.store(in: &subscriptions)
    }
    
    private func bind() {
        let publisher = viewModel.$view.removeDuplicates().eraseToAnyPublisher()
        subscribe(to: publisher)
    }
}

private extension MainViewController {
    func presentLoginScreen() {
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true) { [weak self] in
            self?.remove(self?.splashScreenViewController)
        }
    }
    
    func presentSplashScreen() {
        addFullScreen(childViewController: splashScreenViewController)
    }
    
    func presentHomeScreen() {
        remove(splashScreenViewController)
        addFullScreen(childViewController: homeScreenViewController)
        if loginViewController.presentingViewController != nil {
            dismiss(animated: true)
        }
    }
}

private extension UIViewController {
    func addFullScreen(childViewController child: UIViewController) {
        guard child.parent == nil else {
            return
        }
        addChild(child)
        view.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            child.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        child.didMove(toParent: self)
    }
    
    func remove(_ child: UIViewController?) {
        guard let child = child, child.parent != nil else { return }
        
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
