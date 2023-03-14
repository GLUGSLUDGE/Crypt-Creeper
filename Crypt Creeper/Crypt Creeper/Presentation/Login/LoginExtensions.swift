//
//  LoginExtensions.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 25/2/23.
//

import SwiftUI

extension LoginView {
    
    func goToSignUp() -> some View {
        NavigationLink {
            SignUpView()
        } label: {
            PopUpsView(title: "Sign Up") {
                HStack {
                    Image("Ghost")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 5)
                    BoldText(title: "Not an user?\nWhat a loser!\nClick here!!",fontSize: 30)
                        .foregroundColor(Color.ui.text)
                        .multilineTextAlignment(.leading)
                }
            }.padding()
        }
        .frame(width: 300)
        .padding(.leading, -10)
    }
    
    func loginPopUp() -> some View {
        PopUpsView(title: "LOGIN") {
            VStack {
                HStack {
                    ThinText(title: "Username:",fontSize: 30)
                        .foregroundColor(Color.ui.text)
                        .padding(.bottom, -10)
                        .padding(.leading, 20)
                    Spacer()
                }
                HStack {
                    TextFieldLabel(field: $viewModel.name)
                        .focused($focusedField, equals: .userField)
                        .padding(.horizontal, 20)
                    Spacer()
                }
                HStack {
                    ThinText(title: "Password:",fontSize: 30)
                        .foregroundColor(Color.ui.text)
                        .padding(.bottom, -10)
                        .padding(.leading, 20)
                    Spacer()
                }
                HStack {
                    PasswordField(field: $viewModel.password)
                        .focused($focusedField, equals: .passwordField)
                        .padding(.horizontal, 20)
                        .padding(.trailing, 160)
                        .padding(.bottom)
                    Spacer()
                }
            }
            .padding(.top)
            .padding(.horizontal)
        }
        .padding(.bottom, 100)
    }
    
    func loginButton() -> some View {
        Button {
            
            viewModel.login { result, error in
                if let message = result {
                    self.viewModel.message = message
                    viewModel.onSuccess(message: message)
                }else if let error = error {
                  //  self.viewModel.message = error.customLocalizedDescription
                    self.viewModel.onError(error: error.customLocalizedDescription)
                }
            }

        } label: {
            MiniButtonLabel(title: "Login", fontSize:30, widthSize: 2.5,heightSize:11.5)
        }
        .padding(.trailing, 20)
        .background(
            NavigationLink("", destination: HomeView(), isActive: $viewModel.isLoged)
        )
    }
}
