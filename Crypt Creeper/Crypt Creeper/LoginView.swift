//
//  LoginView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 16/2/23.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
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
                            BoldText(title: "Sin cuenta?\nRegistrate")
                                .foregroundColor(Color.ui.text)
                        }
                    }, title: "Sign Up", show: true)
                    .frame(width: 300)
                    Spacer()
                }
                Spacer()
                PopUpsView(bodyContent: {
                    VStack {
                        ThinText(title: "Usuario")
                            .foregroundColor(Color.ui.text)
                            .padding(.trailing, 230)
                        TextFieldLabel(field: username)
                        ThinText(title: "Contraseña")
                            .foregroundColor(Color.ui.text)
                            .padding(.trailing, 200)
                            .padding(.top)
                        SecureFieldLabel(field: username)
                            .padding(.bottom, 30)
                    }
                    .padding(.top)
                }, title: "LOGIN", show: true)
                .padding(.bottom)
                Spacer()
                Button {
                    //
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
