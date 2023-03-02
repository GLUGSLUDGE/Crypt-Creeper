//
//  SignUpView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 22/2/23.
//

import SwiftUI

struct SignUpView: View {
    
    
    // MARK: - Properties
    
    enum Field: Hashable {
        case userField
        case emailField
        case passwordField
        case repeatPasswordField
    }
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var repeatPassword: String = ""
    
    @FocusState var focusedField: Field?
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.ui.popUpColor
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    goToLogin()
                }
                ZStack {
                    // MARK: - Sign Up Form Stack
                    VStack{
                        HStack {
                            signUpPopUp()
                            Spacer()
                        }
                        Spacer()
                    }
                    // MARK: - Profile Pic Stack
                    VStack{
                        Spacer()
                        HStack {
                            Spacer()
                            selectImage()
                        }
                    }
                }
                // MARK: - Button Stack
                HStack {
                    Spacer()
                    signUpButton()
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
