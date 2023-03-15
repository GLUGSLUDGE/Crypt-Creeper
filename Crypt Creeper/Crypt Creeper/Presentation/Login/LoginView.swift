//
//  LoginView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 16/2/23.
//

import SwiftUI

struct LoginView: View {


    // MARK: - Properties

    @ObservedObject var viewModel: ViewModel = ViewModel()


    // MARK: - Body

    var body: some View {
        ZStack {
            Color.ui.popUpColor
                .ignoresSafeArea()
            VStack {
                HStack {
                    goToSignUp
                    Spacer()
                }
                Spacer()
                loginPopUp
                Spacer()
                HStack {
                    Spacer()
                    loginButton
                }
            }
            .padding()
        }
        .alertCustom(title: viewModel.alertTitle, message: viewModel.alertMessage, show: $viewModel.showAlert)
    }
    
    
    // MARK: - Accesory Views
    
    var goToSignUp: some View {
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
            }
        }
        .frame(width: 300)
        .padding(.leading, -10)
    }
    
    var loginPopUp: some View {
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
                        .padding(.horizontal, 20)
                        .padding(.trailing, 160)
                        .padding(.bottom)
                    Spacer()
                }
            }
            .padding(.top)
        }
        .padding(.bottom, 100)
    }
    
    var loginButton: some View {
        Button {
            if viewModel.name.isEmpty {
                print("no name")
                viewModel.alertTitle = "Name field incomplete"
                viewModel.showAlert = true
            } else if viewModel.password.isEmpty {
                viewModel.alertTitle = "Password field incomplete"
                viewModel.showAlert = true
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
            MiniButtonLabel(title: "Login", fontSize:30, widthSize: 2.5,heightSize:11.5)
        }
        .padding(.trailing, 20)
        .background(
            NavigationLink("", destination: HomeView(), isActive: $viewModel.isLoged)
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
