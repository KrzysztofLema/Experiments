//
//  HomeView.swift
//  Experiments
//
//  Created by Krzysztof Lema on 13/02/2021.
//

import Foundation
import SwiftUI
struct HomeView: View {
    
    var body: some View {
        Text("Welcome on Home Screen")
    }
}
#if DEBUG
struct HomeView_Previes: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif


