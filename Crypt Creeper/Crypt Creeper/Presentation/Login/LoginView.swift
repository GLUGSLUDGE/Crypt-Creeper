//
//  LoginView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 16/2/23.
//

import SwiftUI

struct LoginView: View {


    // MARK: - Properties

    enum Field: Hashable {
        case userField
        case passwordField
    }

    @FocusState var focusedField: Field?

    @ObservedObject var viewModel: ViewModel = ViewModel()


    // MARK: - Body

    var body: some View {
        ZStack {
            Color.ui.popUpColor
                .ignoresSafeArea()
            VStack {
                HStack {
                    goToSignUp()
                    Spacer()
                }
                Spacer()
                loginPopUp()
                Spacer()
                HStack {
                    Spacer()
                    loginButton()
                }
            }
            .padding()
        }
        .alertCustom(title: viewModel.alertTitle, message: viewModel.alertMessage, show: $viewModel.showAlert)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
