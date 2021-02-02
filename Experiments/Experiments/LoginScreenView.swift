//
//  LoginScreenView.swift
//  Experiments
//
//  Created by Krzysztof Lema on 27/01/2021.
//

import SwiftUI

struct LoginScreenView: View {
    
    @State var login: String = ""
    @State var password: String = ""
    
    let blueColor = Color(.systemBlue)
    var body: some View {
        VStack {
            TextField("Login", text: $login)
                .padding()
            TextField("Password", text: $password)
                .padding()
            Button("Log in") {}
                .buttonStyle(FilledButton())
        }
    }
}


struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}

struct FilledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(.white)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
    }
}
