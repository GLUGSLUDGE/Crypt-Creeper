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
                                .frame(width: 100, height: 100)
                                .padding(.bottom, 5)
                            BoldText(title: "Not an user?\nWhat a loser!\nClick here!!")
                                .foregroundColor(Color.ui.text)
                        }
                    }, title: "Sign Up", show: true)
                    .frame(width: 300)
                    .padding(.leading, -10)
                    Spacer()
                    
                }
                Spacer()
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
                            TextFieldLabel(field: username)
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
                            PasswordField(field: password)
                                .focused($focusedField, equals: .passwordField)
                                .padding(.horizontal, 20)
                                .padding(.bottom)
                            Spacer()
                        }
                        
                    }
                    .padding(.top)
                }, title: "LOGIN", show: true)
                .padding(.bottom, 50)
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
