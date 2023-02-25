//
//  LoginExtensions.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 25/2/23.
//

import SwiftUI

extension LoginView {
    
    func goToSignUp() -> some View {
        PopUpsView(bodyContent: {
            HStack {
                Image("Ghost")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 5)
                BoldText(title: "Not an user?\nWhat a loser!\nClick here!!")
                    .foregroundColor(Color.ui.text)
            }
        }, title: "Sign Up", show: true)
        .frame(width: 300)
        .padding(.leading, -10)
    }
    
    func loginPopUp() -> some View {
        PopUpsView(bodyContent: {
            VStack {
                HStack {
                    ThinText(title: "Username:")
                        .foregroundColor(Color.ui.text)
                        .padding(.bottom, -10)
                        .padding(.leading, 20)
                    Spacer()
                }
                HStack {
                    TextFieldLabel(field: $username)
                        .focused($focusedField, equals: .userField)
                        .padding(.horizontal, 20)
                    Spacer()
                }
                HStack {
                    ThinText(title: "Password:")
                        .foregroundColor(Color.ui.text)
                        .padding(.bottom, -10)
                        .padding(.leading, 20)
                    Spacer()
                }
                HStack {
                    PasswordField(field: $password)
                        .focused($focusedField, equals: .passwordField)
                        .padding(.horizontal, 20)
                        .padding(.trailing, 160)
                        .padding(.bottom)
                    Spacer()
                }
            }
            .padding(.top)
        }, title: "LOGIN", show: true)
        .padding(.bottom, 100)
    }
    
    func loginButton() -> some View {
        Button {
            if username.isEmpty {
                print("no name")
                focusedField = .userField
            } else if password.isEmpty {
                print("no pass")
                focusedField = .passwordField
            } else {
                viewModel.login(name: username, password: password)
            }
        } label: {
            MiniButtonLabel(title: "Login")
        }
        .padding(.trailing, 20)
    }
}
