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
        }
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
                    TextFieldLabel(field: $viewModel.name)
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
                    PasswordField(field: $viewModel.password)
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
            if viewModel.name.isEmpty {
                print("no name")
                viewModel.alertTitle = "Name field incomplete"
                viewModel.showAlert = true
                focusedField = .userField
            } else if viewModel.password.isEmpty {
                viewModel.alertTitle = "Password field incomplete"
                viewModel.showAlert = true
                focusedField = .passwordField
            } else {
                viewModel.login { result in
                    switch result {
                    case .success(let message):
                        self.viewModel.message = message
                        viewModel.onSuccess(message: message)
                    case .failure(let error):
                        self.viewModel.message = error.localizedDescription
                        viewModel.onError(error: error.localizedDescription)
                    }
                }
            }
        } label: {
            MiniButtonLabel(title: "Login")
        }
        .padding(.trailing, 20)
        .background(
            NavigationLink("", destination: HomeView(), isActive: $viewModel.isLoged)
        )
    }
}
