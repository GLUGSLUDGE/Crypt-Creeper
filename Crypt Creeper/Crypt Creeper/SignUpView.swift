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
                    .onTapGesture {
                        // Navigate to login
                    }
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
                                            SecureFieldLabel(field: password)
                                                .focused($focusedField, equals: .passwordField)
                                                .padding(.leading, 20)
                                                .padding(.trailing, 140)
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
                                            SecureFieldLabel(field: repeatPassword)
                                                .focused($focusedField, equals: .repeatPasswordField)
                                                .padding(.leading, 20)
                                                .padding(.trailing, 140)
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
//                                            .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.width/6)
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
//                                            .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.width/6)
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
                            .padding(.bottom, 30)
                        }
                    }
                }
                HStack {
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
                    .padding(.bottom, 5)
                    .padding(.trailing, 35)
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
