//
//  FirstView.swift
//  Experiments
//
//  Created by Krzysztof Lema on 21/01/2021.
//

import SwiftUI
struct FirstView: View {
    
    init() {}
  
    var body: some View {
        ZStack {
          Text("F           BER")
            .font(.largeTitle)
            .foregroundColor(.black)
        }
    }
}
#if DEBUG
struct SplashScreen_Previews : PreviewProvider {
  static var previews: some View {
    FirstView()
  }
}
#endif
