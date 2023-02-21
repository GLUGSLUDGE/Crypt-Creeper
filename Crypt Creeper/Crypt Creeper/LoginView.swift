//
//  LoginView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 16/2/23.
//

import SwiftUI

struct LoginView: View {
    enum Field: Hashable {
        case userField
        case passwordField
    }
    @State var username: String = ""
    @State var password: String = ""
    @FocusState private var focusedField: Field?
    var body: some View {
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            VStack {
                HStack {
                    PopUpsView(bodyContent: {
                        HStack {
                            Image("Ghost")
                                .resizable()
                                .scaledToFit()
                                .padding(.bottom, 5)
                            BoldText(title: "Sin cuenta?Registrate")
                                .foregroundColor(Color.ui.text)
                        }
                    }, title: "Sign Up", show: true)
                    .frame(width: 300)
                    Spacer()
                }
                Spacer()
                PopUpsView(bodyContent: {
                    VStack {
                        ThinText(title: "Usuario:")
                            .foregroundColor(Color.ui.text)
                            .padding(.trailing, 200)
                        TextFieldLabel(field: username)
                            .focused($focusedField, equals: .userField)
                        ThinText(title: "Contraseña:")
                            .foregroundColor(Color.ui.text)
                            .padding(.trailing, 150)
                            .padding(.top)
                        PasswordField(field: password)
                            .focused($focusedField, equals: .passwordField)
                            .padding(.bottom)
//                        SecureFieldLabel(field: password)
//                            .focused($focusedField, equals: .passwordField)
//                            .padding(.bottom, 30)
                    }
                    .padding(.top)
                }, title: "LOGIN", show: true)
                Spacer()
                Button {
                    if username.isEmpty {
                        focusedField = .userField
                    } else if password.isEmpty {
                        focusedField = .passwordField
                    } else {
                        print("log")
                    }
                } label: {
                    MiniButtonLabel(title: "Login")
                }
                .padding(.leading, 200)
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
