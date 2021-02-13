//
//  LoginScreenImpl.swift
//  Experiments
//
//  Created by Krzysztof Lema on 13/02/2021.
//

import Foundation
protocol LoginRepository {
    func logIn(login: String, password: String)
    func logOut()
}

class LoginRepositoryImpl: LoginRepository {
    func logIn(login: String, password: String) {
        print("LogIn")
    }
    
    func logOut() {
        
    }
}
