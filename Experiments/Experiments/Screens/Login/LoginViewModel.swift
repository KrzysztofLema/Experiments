//
//  LoginViewModel.swift
//  Experiments
//
//  Created by Krzysztof Lema on 10/02/2021.
//

import Foundation

class LoginViewModel {
    private let loginRepository: LoginRepository
    private let loginResponder: LoginResponder
    
    init(loginRepository: LoginRepository, loginResponder: LoginResponder) {
        self.loginRepository = loginRepository
        self.loginResponder = loginResponder
    }
    
    func logIn(login: String, password: String) {
        loginRepository.logIn(with: Credentials(login: login, password: password), completionHandler: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.loginResponder.signedIn()
            }
        })
    }
}
