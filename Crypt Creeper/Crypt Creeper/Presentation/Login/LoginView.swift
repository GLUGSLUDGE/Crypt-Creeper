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
    
    @State var username: String = ""
    @State var password: String = ""
    
    @FocusState var focusedField: Field?
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.accentColor
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
        .alertCustom(title: viewModel.title, message: viewModel.message, show: $viewModel.showAlert)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
