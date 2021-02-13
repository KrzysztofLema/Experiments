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
    
    let viewModel: LoginViewModel
    
    let blueColor = Color(.systemBlue)
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "moon.stars")
                    .scaleEffect(3)
                    .foregroundColor(.blue)
                    .offset(x: -15)
                VStack {
                    Text("Welcome to")
                        .italic()
                        .bold()
                    Text("Experiments")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
            }
            .lineLimit(2)
            .multilineTextAlignment(.trailing)
            .padding(.horizontal)
            
            TextField("Login", text: $login)
                .textFieldStyle(LoginTextField())
            
            TextField("Password", text: $password)
                .textFieldStyle(LoginTextField())
            
            Button("Log in") {}
                .buttonStyle(FilledButton())
        }
        
    }
}


struct LoginScreenView_Previews: PreviewProvider {
    
    var viewModel: LoginViewModel
    
    static var previews: some View {
        LoginScreenView(viewModel: LoginViewModel(loginRepository: LoginRepositoryImpl()))
    }
}

struct FilledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
    }
}

struct LoginTextField: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        return configuration
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 7, trailing: 16))
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(lineWidth: 2)
                        .foregroundColor(.blue))
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
    }
}
