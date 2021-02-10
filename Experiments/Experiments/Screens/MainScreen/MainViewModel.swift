//
//  MainViewModel.swift
//  Experiments
//
//  Created by Krzysztof Lema on 10/02/2021.
//

import Foundation
class MainViewModel {
    @Published private(set) var view: ViewToPresent = .splashScreen
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.view = .loginScreen
        }
    }
}
