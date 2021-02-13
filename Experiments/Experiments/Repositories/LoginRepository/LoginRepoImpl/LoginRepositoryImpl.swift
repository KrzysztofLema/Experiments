//
//  LoginScreenImpl.swift
//  Experiments
//
//  Created by Krzysztof Lema on 13/02/2021.
//

import Foundation
protocol LoginRepository {
    func logIn(with credentials: Credentials, completionHandler: () -> ())
    func logOut()
}

class LoginRepositoryImpl: LoginRepository {
    func logIn(with credentials: Credentials, completionHandler: () -> ()) {
        print("logged in with credentials: \(credentials)")
        completionHandler()
    }
    
    func logOut() {
        print("LogOut")
    }
}
