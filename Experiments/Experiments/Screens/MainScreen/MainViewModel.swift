//
//  MainViewModel.swift
//  Experiments
//
//  Created by Krzysztof Lema on 10/02/2021.
//

import Foundation

protocol LoginResponder {
    func signedIn()
    func notSignedIn()
}

class MainViewModel: LoginResponder {
    @Published private(set) var view: ViewToPresent = .splashScreen
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            self.view = .loginScreen
        }
    }
    
    public func signedIn() {
        view = .homeScreen
    }
    
    public func notSignedIn() {
        view = .loginScreen
    }
}
