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
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 7, trailing: 16))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(lineWidth: 2)
                            .foregroundColor(.blue))
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                
               
                
            TextField("Password", text: $password)
                .padding()
                .foregroundColor(.white)
                .accentColor(.white)
                .background(Color.gray)
                
            Button("Log in") {}
                .buttonStyle(FilledButton())
        }
        .padding()
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
            .background(Color.gray)
            .cornerRadius(8)
    }
}

struct CustomTextField {
    
}
