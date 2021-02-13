//
//  LoginViewModel.swift
//  Experiments
//
//  Created by Krzysztof Lema on 10/02/2021.
//

import Foundation

class LoginViewModel {
   private let loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    func logIn(login: String, password: String) {
        loginRepository.logIn(with: Credentials(login: login, password: password))
    }
    
    
}
