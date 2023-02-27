//
//  SignUpExtensions.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 25/2/23.
//

import SwiftUI

extension SignUpView {
    
    func goToLogin() -> some View {
        PopUpsView(bodyContent: {
            HStack {
                Image("Hans")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 5)
                BoldText(title: "CLICK HERE IF YOU ARE NOT NEW!!!")
                    .foregroundColor(Color.ui.text)
            }
        }, title: "Login", show: true)
        .frame(width: 300, height: 170)
        .onTapGesture {
            // Navigate to login
        }
    }
    
    func signUpPopUp() -> some View {
        PopUpsView(bodyContent: {
            VStack {
                HStack {
                    ThinText(title: "Username:")
                        .foregroundColor(Color.ui.text)
                        .padding(.bottom, -10)
                        .padding(.leading, 20)
                    Spacer()
                }
                TextFieldLabel(field: $username)
                    .focused($focusedField, equals: .userField)
                    .padding(.horizontal, 20)
                HStack {
                    ThinText(title: "Email:")
                        .foregroundColor(Color.ui.text)
                        .padding(.bottom, -10)
                        .padding(.leading, 20)
                    Spacer()
                }
                TextFieldLabel(field: $email)
                    .focused($focusedField, equals: .emailField)
                    .padding(.horizontal, 20)
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
                        .padding(.leading, 20)
                        .padding(.trailing, 120)
                    Spacer()
                }
                HStack {
                    ThinText(title: "Repeat password:")
                        .foregroundColor(Color.ui.text)
                        .padding(.bottom, -10)
                        .padding(.leading, 20)
                    Spacer()
                }
                HStack {
                    PasswordField(field: $repeatPassword)
                        .focused($focusedField, equals: .repeatPasswordField)
                        .padding(.leading, 20)
                        .padding(.trailing, 120)
                        .padding(.bottom, 30)
                    Spacer()
                }
            }
        }, title: "SIGN UP", show: true)
        .frame(width: 300)
    }
    
    func selectImage() -> some View {
        PopUpsView(bodyContent: {
            HStack {
                VStack {
                    Image(systemName: "photo.on.rectangle.angled")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .rotationEffect(.degrees(-25))
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            // Abrir galería
                        }
                    ThinText(title: "Gallery")
                        .foregroundColor(Color.white)
                }
                VStack {
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .rotationEffect(.degrees(25))
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            // Abrir cámara
                        }
                    ThinText(title: "Camera")
                        .foregroundColor(Color.white)
                }
            }
        }, title: "Profile Pic", show: true)
        .frame(width: 250)
    }
    
    func signUpButton() -> some View {
        Button {
            if username.isEmpty {
                focusedField = .userField
            } else if email.isEmpty {
                focusedField = .emailField
            } else if password.isEmpty {
                focusedField = .passwordField
            } else if repeatPassword.isEmpty {
                focusedField = .repeatPasswordField
            } else if password != repeatPassword {
                print("pringao xDD")
            } else {
                // TODO: Navigate to home
            }
        } label: {
            MiniButtonLabel(title: "Sign Up")
        }
        .padding(.bottom, 5)
        .padding(.trailing, 35)
    }
}
