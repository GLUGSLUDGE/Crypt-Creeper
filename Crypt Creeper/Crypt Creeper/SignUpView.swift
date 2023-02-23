//
//  SignUpView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 22/2/23.
//

import SwiftUI

struct SignUpView: View {
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
    @FocusState private var focusedField: Field?
    var body: some View {
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
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
                }
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        VStack{
                            HStack {
                                PopUpsView(bodyContent: {
                                    VStack {
                                        HStack {
                                            ThinText(title: "Username:")
                                                .foregroundColor(Color.ui.text)
                                                .padding(.bottom, -10)
                                                .padding(.leading, 20)
                                            Spacer()
                                        }
                                        TextFieldLabel(field: username)
                                            .focused($focusedField, equals: .userField)
                                            .padding(.horizontal, 20)
                                        HStack {
                                            ThinText(title: "Email:")
                                                .foregroundColor(Color.ui.text)
                                                .padding(.bottom, -10)
                                                .padding(.leading, 20)
                                            Spacer()
                                        }
                                        TextFieldLabel(field: email)
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
                                            PasswordField(field: password)
                                                .focused($focusedField, equals: .passwordField)
                                                .frame(width: 140)
                                                .padding(.horizontal, 20)
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
                                            PasswordField(field: repeatPassword)
                                                .focused($focusedField, equals: .repeatPasswordField)
                                                .frame(width: 140)
                                                .padding(.horizontal, 20)
                                                .padding(.bottom, 30)
                                            Spacer()
                                        }
                                    }
                                }, title: "SIGN UP", show: true)
                                .frame(width: 300)
                                Spacer()
                            }
                            Spacer()
                        }
                        VStack{
                            Spacer()
                            PopUpsView(bodyContent: {
                                HStack {
                                    VStack {
                                        Image(systemName: "photo.on.rectangle.angled")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(Color.white)
                                            .rotationEffect(.degrees(-25))
                                            .padding(.horizontal, 10)
                                        ThinText(title: "Galería")
                                            .foregroundColor(Color.white)
                                    }
                                    VStack {
                                        Image(systemName: "camera")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(Color.white)
                                            .rotationEffect(.degrees(25))
                                            .padding(.horizontal, 10)
                                        ThinText(title: "Cámara")
                                            .foregroundColor(Color.white)
                                    }
                                }
                            }, title: "Profile Pic", show: true)
                            .frame(width: 300)
                        }
                    }
                }
                Spacer()
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
                        print("Login")
                    }
                } label: {
                    MiniButtonLabel(title: "Sign Up")
                }
                .padding(.leading, 200)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
