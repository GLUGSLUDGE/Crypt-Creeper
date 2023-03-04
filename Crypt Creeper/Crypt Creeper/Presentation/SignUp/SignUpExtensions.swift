//
//  SignUpExtensions.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 25/2/23.
//

import SwiftUI

extension SignUpView {
    
    func signUpPopUp() -> some View {
        PopUpsView(title: "SIGN UP") {
            textfieldsViews
        }
        .frame(width: 300)
    }
    
    var textfieldsViews: some View {
        VStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 0) {
                ThinText(title: "Username:")
                    .foregroundColor(Color.ui.text)
                    .padding(.leading, 20)
                
                TextFieldLabel(field: $viewModel.username)
                    .padding(.horizontal, 20)
            }
            VStack(alignment: .leading, spacing: 0) {
                ThinText(title: "Email:")
                    .foregroundColor(Color.ui.text)
                    .padding(.leading, 20)
                
                TextFieldLabel(field: $viewModel.email)
                    .padding(.horizontal, 20)
            }
            VStack(alignment: .leading, spacing: 0) {
                ThinText(title: "Password:")
                    .foregroundColor(Color.ui.text)
                    .padding(.leading, 20)
                
                PasswordField(field: $viewModel.password)
                    .padding(.leading, 20)
                    .padding(.trailing, 120)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                ThinText(title: "Repeat password:")
                    .foregroundColor(Color.ui.text)
                    .padding(.leading, 20)
                
                PasswordField(field: $viewModel.repeatPassword)
                    .padding(.leading, 20)
                    .padding(.trailing, 120)
                    .padding(.bottom, 30)
            }
        }
    }
    
    func signUpForm(titleText: String, paddingTextEdge: Edge.Set, paddingFieldEdge: Edge.Set, paddingTextSize: CGFloat, paddingFieldSize: CGFloat, feidl: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            ThinText(title: titleText)
                .foregroundColor(Color.ui.text)
                .padding(paddingTextEdge, paddingTextSize)
            
            TextFieldLabel(field: feidl)
                .padding(paddingFieldEdge, paddingFieldSize)
        }
    }
    
    @ViewBuilder func galleryImage(completion: @escaping () -> ()) -> some View {
        ImageSysName(image: "photo.on.rectangle.angled") {
            completion()
        }
        .foregroundColor(Color.white)
        .rotationEffect(.degrees(-25))
        .padding(.horizontal, 10)
    }
    
    @ViewBuilder func cameraImage(completion: @escaping () -> ()) -> some View {
        ImageSysName(image: "camera") {
            completion()
        }
        .foregroundColor(Color.white)
        .rotationEffect(.degrees(25))
        .padding(.horizontal, 10)
    }
}
