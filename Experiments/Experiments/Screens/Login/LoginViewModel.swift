//
//  LoginViewModel.swift
//  Experiments
//
//  Created by Krzysztof Lema on 10/02/2021.
//

import Foundation

class LoginViewModel {
    let loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
}
